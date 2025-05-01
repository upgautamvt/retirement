#define _GNU_SOURCE
#include <sched.h>
#include <sys/times.h>
#include "cacheutils.h"
#include <x86intrin.h>
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

static int semaphore_v()
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

static int semaphore_p()
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

static int semaphore_init()
{
    sem_id = semget((key_t)SEM_KEY, 0, 0666 | IPC_CREAT);
    if (sem_id == -1) {
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

    return 0;
}

u_int64_t t[1000000];
void set_cpu(int id);

int main()
{
	int rv,i,j,z,temp = 1;
    	int shmid;
    	register u_int64_t time1, time2, time3;
    	puts("cpu affinity set");
    	 // pin CPU
    	set_cpu(8);
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
	// Coarse synchronization via shared memory, can be a fixed time agreed in advance
	semaphore_p();
    	memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);
	time3 = t[0] + 20000;
    	
    	printf("time:%ld\n", time1);
    	
	
	for(j=0;j<100000;j++){
		i = j % 8;
    		time2 = rdtsc();
    		while(time2 < time3) time2 = rdtsc();
    		// sender's loop, changed in send.s, lines 626 to 787
    		if(i == 0) {
			for(z = 0; z < 100; z++){
			
			}
		} else if(i == 1) {
			for(z = 0; z < 100; z++){
			
			}
		} else if(i == 2) {
			for(z = 0; z < 100; z++){
			
			}
		}else if(i == 3) {
			for(z = 0; z < 100; z++){
			
			}
		}else if(i == 4) {
			for(z = 0; z < 100; z++){
			
			}
		}else if(i == 5) {
			for(z = 0; z < 100; z++){
			
			}
		}else if(i == 6) {
			for(z = 0; z < 100; z++){
			
			}
		} else {
			for(z = 0; z < 100; z++){
			
			}
		}
		time3 += 7000;
    	}

	rv = sharemmy_destroy(shmid, shm);
    	if (rv < 0) {
        	printf("Destroy share memory fail.\n");
        	return 0;
    	}
	return 0;
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
