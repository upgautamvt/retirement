#ifndef CACHEUTILS_H
#define CACHEUTILS_H

#ifndef HIDEMINMAX
#define MAX(X,Y) (((X) > (Y)) ? (X) : (Y))
#define MIN(X,Y) (((X) < (Y)) ? (X) : (Y))
#endif

#include <stdint.h>

uint64_t rdtsc_nofence(void);
uint64_t rdtsc(void);
uint64_t rdtsc_begin(void);
uint64_t rdtsc_end(void);
void maccess(void* p);
void flush(void* p);
void prefetch(void* p);
void longnop(void);

#endif
