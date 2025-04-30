#include "utils/shared.h"
#include <sys/un.h>
#include <sys/types.h>

/* Global array for timing measurements */
u_int64_t t[1000000];

//always send should run after receive is run
int main() {
    int rv, i, j, z;
    int shmid;
    /* Use register variables for timing */
    register u_int64_t time2, time3;

    puts("cpu affinity set");
    set_cpu(16);         // Pin this process to the CPU 16
    if (check_cpu_affinity() < 0) {
        fprintf(stderr, "Warning: CPU affinity check failed, continuing anyway\n");
    }

    puts("Semaphore get");
    rv = semaphore_get();
    if (rv < 0) {
        printf("Init semaphore failed.\n");
        return 0;
    }

    puts("share memory init");
    shmid = sharemmy_init();
    if (shmid == -1) {
        printf("Init shared memory failed.\n");
        return 0;
    }

    //both sender and receiver complete getting rv and shmid. This ensures they both get same
    //semaphore set and shared memory

    /* Wait for the receiver to write the timestamp */
    //P operation decrements the semaphore value (or blocks if the value is 0), ensuring that a process
    //waits until a resource is available
    semaphore_p(); //initially it blocks because value is 0 (there is nothing at the beginning)
    //blocking to sender means allowing to receiver

    //it means if sender ran way before receiver then it stops at semaphore_p(), if receiver ran then even better
    //because receiver does all it needs to do and calls semaphore_v() to signal sender

    //the sender's job is to wait the receiver's signal
    //pkt is updated by receiver, where receiver put the timestamps
    //now, sender stores these pkt's timestamps back into its own t array
    // it means both sender's and receiver's t array are same
    memcpy(t, ((shared_use_t*)shm)->pkt, ((shared_use_t*)shm)->pktlen);
    time3 = t[0] + 20000; //this is exactly same value as time1 of receiver

    printf("time:%ld\n", time3);

    /*
     * In each iteration, we busy-wait until the timestamp counter (TSC) reaches time3.
     * Then we run one of eight empty loops 100 times to introduce a small delay.
     * Finally, time3 is incremented by 7000 cycles.
     */
    for (j = 0; j < 100000; j++) {
        i = j % 8; //the assumption is i is secret, and it is based on j
        time2 = rdtsc();

        //busy looping to sync up with receiver so that the lines belwo i.e., if block start exactly on the same time
        while (time2 < time3)
            time2 = rdtsc();

        //starts on timettttt

        //each branch here is used to represent different stall modulation scenario, although they are same here
        // in real secret leak, they should be doing something different

        //there can be only two branches.
        if (i == 0) {
            for (z = 0; z < 100; z++) { } //receiver knows the time for this exactly
        }
        else if (i == 1) {
            for (z = 0; z < 100; z++) { } // this is unknown to receiver
        }
        else if (i == 2) {
            for (z = 0; z < 100; z++) { }
        }
        else if (i == 3) {
            for (z = 0; z < 100; z++) { }
        }
        else if (i == 4) {
            for (z = 0; z < 100; z++) { }
        }
        else if (i == 5) {
            for (z = 0; z < 100; z++) { }
        }
        else if (i == 6) {
            for (z = 0; z < 100; z++) { }
        }
        else {
            for (z = 0; z < 100; z++) { }
        }
        time3 += 7000;
    }

    rv = sharemmy_destroy(shmid, shm);
    if (rv < 0) {
        printf("Destroy shared memory failed.\n");
        return 0;
    }
    return 0;
}
