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

int i=0,j=0;
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
void calla(){};

int main()
{
    int rv;
    int shmid;
    register u_int64_t time1, time2;
    // pin CPU
    set_cpu(8);
    u_int64_t t[800200];
    cpu_set_t get;
    for (i = 10; i < 40010; i++) {
	t[0] = t[0] + 20000;
        time1 = rdtsc();
        while (time1 < t[0]) time1 = rdtsc();
	
	for (int z = 0; z < 20; z++) {
		time2 = rdtsc();
		// changed in recieve.s, lines 740 to 777
		for(j=0;j<100;j++)
    		{
			temp2=m+23323;
    		}
		t[i * 20 + z] = rdtsc() - time2;
	}
    }

    u_int64_t sum = 0;
    
    for (i = 200; i < 800200; i++) {
	printf("%ld\n", t[i]);
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
