#include "cacheutils.h"

uint64_t rdtsc_nofence() {
  uint64_t a, d;
  asm volatile ("rdtsc" : "=a" (a), "=d" (d));
  return (d << 32) | a;
}

uint64_t rdtsc() {
  uint64_t a, d;
  asm volatile ("mfence");
  asm volatile ("rdtsc" : "=a" (a), "=d" (d));
  asm volatile ("mfence");
  return (d << 32) | a;
}

uint64_t rdtsc_begin() {
  uint64_t a, d;
  asm volatile (
    "mfence\n\t"
    "CPUID\n\t"
    "RDTSCP\n\t"
    "mov %%rdx, %0\n\t"
    "mov %%rax, %1\n\t"
    "mfence\n\t"
    : "=r" (d), "=r" (a)
    :
    : "%rax", "%rbx", "%rcx", "%rdx"
  );
  return (d << 32) | a;
}

uint64_t rdtsc_end() {
  uint64_t a, d;
  asm volatile (
    "mfence\n\t"
    "RDTSCP\n\t"
    "mov %%rdx, %0\n\t"
    "mov %%rax, %1\n\t"
    "CPUID\n\t"
    "mfence\n\t"
    : "=r" (d), "=r" (a)
    :
    : "%rax", "%rbx", "%rcx", "%rdx"
  );
  return (d << 32) | a;
}

void maccess(void* p) {
  asm volatile ("movq (%0), %%rax\n" :: "c" (p) : "rax");
}

void flush(void* p) {
  asm volatile ("clflush 0(%0)\n" :: "c" (p) : "rax");
}

void prefetch(void* p) {
  asm volatile ("prefetcht1 %0" :: "m" (p));
}

void longnop() {
  asm volatile (
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
    "nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
  );
}
