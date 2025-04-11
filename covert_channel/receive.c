#include "utils/shared.h"
#include <sys/un.h>
#include <sys/types.h>

int main() {
    int rv, j, z;
    int shmid;
    register u_int64_t time1, time2, time3;
    u_int64_t t[1000000];
    shared_use_t* shared;

    set_cpu(0); // Pin this process to CPU 0
    cpu_set_t get;
    CPU_ZERO(&get);
    if (sched_getaffinity(0, sizeof(get), &get) == -1) {
        printf("get CPU affinity failed: %s\n", strerror(errno));
        return -1;
    }

    rv = semaphore_init();
    if (rv < 0) {
        printf("Init semaphore failed.\n");
        return 0;
    }

    shmid = sharemmy_init();
    if (shmid == -1) {
        printf("Init shared memory failed.\n");
        return 0;
    }

    /* Get the starting timestamp and write it to shared memory */
    t[0] = rdtsc();
    shared = (shared_use_t*)shm;
    shared->pktlen = sizeof(t[0]);
    memcpy(shared->pkt, t, sizeof(t[0]));
    semaphore_v(); //increment the semaphore count. This increment signals the sender now can proceed
    //the v operation is the mechanism by which the receiver notifies the waiting sender that the sared
    // resource has been set up

    //after the signal is sent, it immediately starts executing below lines because semaphore signals are
    // async. (i.e., non-blocking)
    time1 = t[0] + 20000;

    /*
     * In each iteration, the receiver busy-waits until time1 is reached.
     * It then measures the execution time of an empty loop and prints the measured delay.
     * Finally, time1 is incremented by 7000 cycles.
     */
    for (j = 0; j < 100000; j++) {
        time2 = rdtsc();
        while (time2 < time1)
            time2 = rdtsc();

        ////starts on timettttt
        time3 = rdtsc();
        for (z = 0; z < 100; z++) { }
        t[j] = rdtsc() - time3;
        time1 += 7000;
    }

    //receiver accumulates the total time to run all the  for (z = 0; z < 100; z++) { } loops
    for (j = 0; j < 100000; j++) {
        printf("%ld\n", t[j]);
    }

    //removes process's pointer to shared memory, marks to clean for GC
    rv = sharemmy_destroy(shmid, shm);
    if (rv < 0) {
        printf("Destroy shared memory failed.\n");
        return 0;
    }
    return 1;

    //if(receiver.t[j]<sender.t[j] it means sender did something time-consuming.
    //if there is a high stall here, receiver is sure that i=1 at the sender
}
