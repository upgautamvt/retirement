#include "utils/shared.h"
#include <sys/un.h>
#include <sys/types.h>

//produce re.txt by redirecting standard output by running ./receive > re.txt
int main() {
    int rv, j, z;
    int shmid;
    register u_int64_t time1, time2, time3;
    u_int64_t t[1000000];
    shared_use_t* shared;

    //in 8 core CPU, core 0 and core 8 belong to the same physical coe
    // each physical core has two logical cores. For 8 physical cores, we have
    // logical cores 0, 1, 2, 3, 4, 5, 6, 7, and then again repeat 8, 9, 10,...,
    // To find out more: lscpu -e
    /*
     * As you can see here, in my AMD ryzen 7950x 16 cores CPU, I have total 32 logical cores
     * Physical core 0 shared two CPU i.e., 0 and 16
    *upgautam@amd:~$ lscpu -e
CPU NODE SOCKET CORE L1d:L1i:L2:L3 ONLINE    MAXMHZ   MINMHZ       MHZ
  0    0      0    0 0:0:0:0          yes 5881.0000 400.0000 4751.6250
  1    0      0    1 1:1:1:0          yes 5881.0000 400.0000  400.0000
  2    0      0    2 2:2:2:0          yes 5881.0000 400.0000  400.0000
  3    0      0    3 3:3:3:0          yes 5881.0000 400.0000  400.0000
  4    0      0    4 4:4:4:0          yes 5881.0000 400.0000  400.0000
  5    0      0    5 5:5:5:0          yes 5881.0000 400.0000 5486.9082
  6    0      0    6 6:6:6:0          yes 5881.0000 400.0000 4690.6572
  7    0      0    7 7:7:7:0          yes 5881.0000 400.0000  400.0000
  8    0      0    8 8:8:8:1          yes 5881.0000 400.0000  400.0000
  9    0      0    9 9:9:9:1          yes 5881.0000 400.0000  400.0000
 10    0      0   10 10:10:10:1       yes 5881.0000 400.0000  400.0000
 11    0      0   11 11:11:11:1       yes 5881.0000 400.0000  400.0000
 12    0      0   12 12:12:12:1       yes 5881.0000 400.0000  400.0000
 13    0      0   13 13:13:13:1       yes 5881.0000 400.0000  400.0000
 14    0      0   14 14:14:14:1       yes 5881.0000 400.0000 5486.2100
 15    0      0   15 15:15:15:1       yes 5881.0000 400.0000  400.0000
 16    0      0    0 0:0:0:0          yes 5881.0000 400.0000  400.0000

     */

    //puts("cpu affinity set");
    set_cpu(0); // Pin this process to CPU 0
    if (check_cpu_affinity() < 0) {
        fprintf(stderr, "Warning: CPU affinity check failed, continuing anyway\n");
    }

    //puts("Semaphore Init");
    rv = semaphore_init();
    if (rv < 0) {
        printf("Init semaphore failed.\n");
        return 0;
    }

    //puts("share memory Init");
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
    //the v operation is the mechanism by which the receiver notifies the waiting sender that the shared
    // resource has been set up

    //after the signal is sent, it immediately starts executing below lines because semaphore signals are
    // async. (i.e., non-blocking)
    time1 = t[0] + 20000;

    //printf("time: %" PRIu64 "\n", time1);


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
