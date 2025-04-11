#ifndef SHARED_H
#define SHARED_H

#define _GNU_SOURCE

#include <sched.h>
#include <sys/times.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stddef.h>
#include <errno.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <x86intrin.h>
#include "cacheutils.h"

#define SEM_KEY     100
#define SHM_KEY     101

typedef struct shared_use {
    int pktlen;
    unsigned char pkt[1528];
} shared_use_t;

union semun {
    int val;
    struct semid_ds* buf;
    unsigned short* array;
};

extern int sem_id;
extern void *shm;

/* Semaphore functions */
int semaphore_init(void);
int semaphore_p(void);
int semaphore_v(void);

/* Shared memory functions */
int sharemmy_init(void);
int sharemmy_destroy(int shmid, void *shm_ptr);

/* CPU affinity and related functions */
void set_cpu(int id);
int check_cpu_affinity(void);

#endif /* SHARED_H */
