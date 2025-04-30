#include "shared.h"

/* Global variables for semaphore ID and shared memory pointer */
int sem_id = 0;
void *shm = NULL;

int semaphore_p(void) {
    struct sembuf sem_b;
    sem_b.sem_num = 0;
    sem_b.sem_op = -1;
    sem_b.sem_flg = SEM_UNDO;
    if (semop(sem_id, &sem_b, 1) == -1) {
        perror("semaphore_p failed");
        return -1;
    }
    return 0;
}

int semaphore_v(void) {
    struct sembuf sem_b;
    sem_b.sem_num = 0;
    sem_b.sem_op = 1;
    sem_b.sem_flg = SEM_UNDO;
    if (semop(sem_id, &sem_b, 1) == -1) {
        perror("semaphore_v failed");
        return -1;
    }
    return 0;
}

//instead of making several individual semaphore, we create a set of semaphore. Now, we can control multiple
//shared resources. There is one id for all the semaphore in semaphore set. So, management is easy

//Semaphore is used to control only one process accees a shared resource (used for synchronization)
//first called by receive and then send calls semaphore_get
int semaphore_init(void) {
    union semun sem_union;
    //creates or retrieves a semaphore set
    //SEM_KEY usd to identify semaphore set, 0 second arg. means retrieve the existing semaphore, 0666 permission
    // means r/w for owner,group and others. IPC_CREATE If not existing then create the semaphore set
    sem_id = semget((key_t)SEM_KEY, 1, 0666 | IPC_CREAT);
    if (sem_id == -1) {
        perror("Semaphore creation failed");
        return -1;
    }
    sem_union.val = 0;
    if (semctl(sem_id, 0, SETVAL, sem_union) == -1) {
        perror("semctl SETVAL failed");
        return -1;
    }
    return 0;
}

//just get the already created semaphore. This is called by send
int semaphore_get(void)
{
    sem_id = semget((key_t)SEM_KEY, 0, 0666 | IPC_CREAT);
    if (sem_id == -1) {
        return -1;
    }
    return 0;
}


int sharemmy_init(void) {
    int shmid;
    shmid = shmget((key_t)SHM_KEY, sizeof(shared_use_t), 0666 | IPC_CREAT);
    if (shmid == -1) {
        perror("shmget failed");
        return -1;
    }
    shm = shmat(shmid, NULL, 0);
    if (shm == (void *)-1) {
        perror("shmat failed");
        return -1;
    }
    return shmid;
}

int sharemmy_destroy(int shmid, void *shm_ptr) {
    int rv;
    rv = shmdt(shm_ptr);
    if (rv == -1) {
        perror("shmdt failed");
        return rv;
    }
    rv = shmctl(shmid, IPC_RMID, 0);
    if (rv == -1) {
        perror("shmctl IPC_RMID failed");
        return rv;
    }
    return 0;
}

void set_cpu(int id) {
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(id, &mask);
    if (sched_setaffinity(0, sizeof(mask), &mask) == -1) {
        fprintf(stderr, "warning: could not set CPU affinity: %s\n", strerror(errno));
    }
}

int check_cpu_affinity(void) {
    cpu_set_t get;
    CPU_ZERO(&get);
    if (sched_getaffinity(0, sizeof(get), &get) == -1) {
        fprintf(stderr, "get CPU affinity failed: %s\n", strerror(errno));
        return -1;
    }
    return 0;
}
