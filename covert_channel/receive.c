#define _GNU_SOURCE
#include <sched.h>
#include <sys/times.h>
#include "cacheutils.h"

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stddef.h>
#include <errno.h>
#include <sys/un.h>
#include <sys/types.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/socket.h>

#include <x86intrin.h>

#define SEM_KEY     100
#define SHM_KEY     101


typedef struct shared_use {
    int pktlen;
    unsigned char pkt[1528];
} shared_use_t;

union semun

{
int val;

struct semid_ds *buf;

unsigned short *array;

}sem_union;

static int sem_id = 0;

static void *shm = NULL;

int i=0;
int temp=3;
int temp2=34;
int m=5;
int n=5;


static int semaphore_v(void)
{
    struct sembuf sem_b;

    sem_b.sem_num = 0;
    sem_b.sem_op = 1;
    sem_b.sem_flg = SEM_UNDO;
    if (semop(sem_id, &sem_b, 1) == -1) {
        return -1;
    }

    return 0;
}


static int semaphore_p(void)
{
    struct sembuf sem_b;

    sem_b.sem_num = 0;
    sem_b.sem_op = -1;
    sem_b.sem_flg = SEM_UNDO;
    if (semop(sem_id, &sem_b, 1) == -1) {
        return -1;
    }

    return 0;
}


static int semaphore_init(void)
{
    union semun sem_union;

    sem_id = semget((key_t)SEM_KEY, 1, 0666 | IPC_CREAT);
    if (sem_id == -1) {
        return -1;
    }
    sem_union.val = 0;
    if (semctl(sem_id, 0, SETVAL, sem_union) == -1) {
        return -1;
    }


    return 0;
}


static int sharemmy_init(void)
{
    int shmid;

    shmid = shmget((key_t)SHM_KEY, sizeof(shared_use_t), 0666 | IPC_CREAT);
    if (shmid == -1) {
        return shmid;
    }

    shm = shmat(shmid, (void *)0, 0);
    if (shm == (void *)-1) {
        return -1;
    }

    return shmid;
}


static int sharemmy_destroy(int shmid, void *shm)
{
    int rv;

    rv = shmdt(shm);
    if (rv == -1) {
        return rv;
    }

    rv = shmctl(shmid, IPC_RMID, 0);
    if (rv == -1) {
        return rv;
    }

    return 0;
}
void set_cpu(int id);


int main()
{
    int rv, i, j, num, z, sum = 0;
    int shmid;
    register u_int64_t time1, time2, time3;
    num = 0;
    // pin CPU
    set_cpu(0);
    u_int64_t t[1000000];
    cpu_set_t get;
    shared_use_t *shared;

    CPU_ZERO(&get);
    if (sched_getaffinity(0, sizeof(get), &get) == -1) {
        printf("get CPU affinity failue, ERROR:%s\n", strerror(errno));
        return -1;
    }


    rv = semaphore_init();
    if (rv < 0) {
        printf("Init a semaphore fail.\n");
        return 0;
    }

    shmid = sharemmy_init();
    if (shmid == -1) {
        printf("Init a share memory fail.\n");
        return 0;
    }
    t[0]=rdtsc();
    // Coarse synchronization via shared memory, can be a fixed time agreed in advance
    shared = (shared_use_t *)shm;
    shared->pktlen = sizeof(t[0]);
    memcpy(shared->pkt, t, sizeof(t[0]));
    semaphore_v();

    time1 = t[0] + 20000;

    for(j = 0;j < 100000;j++){
    	time2 = rdtsc();
    	while(time2 < time1) time2 = rdtsc();

	time3 = rdtsc();
	// receiver's loop, changed in recieve.s, lines 669 to 731
	for (z = 0; z < 100; z++){}
	t[j] = rdtsc() - time3;

	time1 += 7000;
    }
    for (j = 0; j < 100000; j++) {
    	printf("%ld\n", t[j]);
    }

    rv = sharemmy_destroy(shmid, shm);
    if (rv < 0) {
        printf("Destroy share memory fail.\n");
        return 0;
    }
    return 1;
}

// setup the cpu set of this program to run on
void set_cpu(int id)
{
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(id, &mask);
    if (sched_setaffinity(0, sizeof(mask), &mask) == -1)
    {
        fprintf(stderr, "warning: could not set CPU affinity/n");
    }
}
