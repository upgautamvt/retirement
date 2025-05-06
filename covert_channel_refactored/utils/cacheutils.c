#include "cacheutils.h"

//asm volatile syntax
/*
asm volatile (
    "template"
    : output_operands
    : input_operands
    : clobber_list
);
*/


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

/**
mfence: all prior load/stores are finished when there is memory fence
    load means reading data (not address) from memory (or cache) into register
    read the memory address all the way to register first and then load (i.e., CPU alu) from register to another register


RDTSCP (variation of RTDSC)
  reads CPU time stamp after all the load/store CPU instructions are completed
  This timestamp's low 32-bits goes in rax and high 32 bits value goes in rdx.
  TSC = (RDX << 32) | RAX

"mov %%rdx, %0"
  %0 (for this read below in operand list, which is " "r" (d) "
  copies the upper 32 bits of the timestamp (from rdx) into the register assigned to d.
  d is a variable you defined in C code. So, compiler has already defined a register to hold d's value

All this is doing is memory fence, then calculate 64-bits TSC value in rdx and rax (high and low 32 bits)
Then you need to move that 64-bits data into the registers which were assigned for your variables a and d.
This means your variable get the final value of TSC.

CPUID instruction is a part of RDTSCP
**/

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

//use: the memory address p in RAM is modified by other core. You can use this function to copy that address
//p all the way into your rcx and then load 8 bytes into rax.
void maccess(void* p) {
  // The `"c"(p)` constraint causes the compiler to emit code that
  // places the pointer value `p` into RCX before the asm runs.
  //
  // The instruction `movq (%rcx), %rax` then:
  //   • Treats RCX as an address (no change to RCX’s contents).
  //   • Loads the 8-byte (quad-word) value at [RCX] into RAX.
  //     This is a memory → register load, not an address copy.
  //
  // After that:
  //   • RCX still holds the original address.
  //   • RAX contains the 64-bit data fetched from memory.
  //
  // (All arithmetic/logical ops in x86 do indeed work on registers;
  // you must load memory into a register before you can operate on it.)
  asm volatile ("movq (%0), %%rax\n"
                :: "c"(p)
                : "rax");
}

//flushing is cache coherence protocol (involves cache hierarchy and main memory)
//there is core's resident memory (private to core)
//if two cores shared the same memory (e.g., address p from memory) then when first core
//modifies the data in its private cache line then that should be reflected (i.e., flushed) all the way to
//main memory so that second core always consumes the updated data. This is flushing
//data at address P in memory = data at L3 at P address = data at L2 at P address = data at L1 at P address =  data at core's resident registers at P address
// but data doesn't need to be at all all layers
//If the line containing address P is already in your L1, the CPU grabs it from there and copies the needed bytes into a register.
void flush(void* p) {
  //cache line flush from CPU caches from the address p
  //0 + %0 address AT&T syntax
  //c tells to pick C type register e.g., RCX
  // a "clobber list" is a list of registers or memory locations that the assembly code modifies, but whose values are not important to the compiler afterwards.
  //"c" (p) means load p address into rcx (no data move, just address copy)
  //rax is garbage, rcx holds p (it means int *p = some_address) rcx holds some_address
  //any instruction uses addresses (the addresses are used to locate the actual hardware's place in memory or in cache line to finally read or consume the data
asm volatile ("clflush 0(%0)\n" :: "c" (p) : "rax");
}

void prefetch(void* p) {
  // this is inline because assembly code is directly written in C/C++ code (it is not separate .s or separate function)
  // no explicit inline keyword is required

  //prefetch1 is used to hint CPU to preload a memory address into the cache because there is a high chance
  // the data will be used soon (but not immediately).
  //This is just a hint (not a command), CPU (logical) can ignore it
  //prefetch0 hints to fetch to L1, 1 does to L2, 2 does to L3 and so on. L1 means immediately needed
  //this is explicit manual optimization instruction
  asm volatile ("prefetcht1 %0" :: "m" (p)); //m: memory, p is the place of memory
}

void prefetch(void* p) {
  asm volatile ("prefetcht1 %0" :: "m" (p)); //m: memory, p is the place of memory
}

void longnop() {
  //asm keyword to embed assembly code
  // volatile tells compile not to reorder or optimize or writes to the variable because it is volatile (means
  // (volatile object's value can change anytime unexpectedly)
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
