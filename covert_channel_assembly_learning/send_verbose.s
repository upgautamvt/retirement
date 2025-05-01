	.file	"send.c"
# GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -g -O0 -fno-inline -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.file 0 "/home/upgautam/CLionProjects/retirement/covert_channel_assembly_learning" "send.c"
	.globl	rdtsc_nofence
	.type	rdtsc_nofence, @function
rdtsc_nofence:
.LFB0:
	.file 1 "cacheutils.h"
	.loc 1 9 28
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# cacheutils.h:11:   asm volatile ("rdtsc" : "=a" (a), "=d" (d));
	.loc 1 11 3
#APP
# 11 "cacheutils.h" 1
	rdtsc	
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)	# a, a
	movq	%rdx, -8(%rbp)	# d, d
# cacheutils.h:12:   a = (d<<32) | a;
	.loc 1 12 9
	movq	-8(%rbp), %rax	# d, tmp87
	salq	$32, %rax	#, _1
# cacheutils.h:12:   a = (d<<32) | a;
	.loc 1 12 5
	orq	%rax, -16(%rbp)	# _1, a
# cacheutils.h:13:   return a;
	.loc 1 13 10
	movq	-16(%rbp), %rax	# a, _5
# cacheutils.h:14: }
	.loc 1 14 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	rdtsc_nofence, .-rdtsc_nofence
	.globl	rdtsc
	.type	rdtsc, @function
rdtsc:
.LFB1:
	.loc 1 16 20
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# cacheutils.h:18:   asm volatile ("mfence");
	.loc 1 18 3
#APP
# 18 "cacheutils.h" 1
	mfence
# 0 "" 2
# cacheutils.h:19:   asm volatile ("rdtsc" : "=a" (a), "=d" (d));
	.loc 1 19 3
# 19 "cacheutils.h" 1
	rdtsc	
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)	# a, a
	movq	%rdx, -8(%rbp)	# d, d
# cacheutils.h:20:   a = (d<<32) | a;
	.loc 1 20 9
	movq	-8(%rbp), %rax	# d, tmp87
	salq	$32, %rax	#, _1
# cacheutils.h:20:   a = (d<<32) | a;
	.loc 1 20 5
	orq	%rax, -16(%rbp)	# _1, a
# cacheutils.h:21:   asm volatile ("mfence");
	.loc 1 21 3
#APP
# 21 "cacheutils.h" 1
	mfence
# 0 "" 2
# cacheutils.h:22:   return a;
	.loc 1 22 10
#NO_APP
	movq	-16(%rbp), %rax	# a, _8
# cacheutils.h:23: }
	.loc 1 23 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	rdtsc, .-rdtsc
	.globl	rdtsc_begin
	.type	rdtsc_begin, @function
rdtsc_begin:
.LFB2:
	.loc 1 25 26
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	.cfi_offset 3, -24
# cacheutils.h:27:   asm volatile ("mfence\n\t"
	.loc 1 27 3
#APP
# 27 "cacheutils.h" 1
	mfence
	CPUID
	RDTSCP
	mov %rdx, %rdi	# d
	mov %rax, %rsi	# a
	mfence
	
# 0 "" 2
#NO_APP
	movq	%rdi, -24(%rbp)	# d, d
	movq	%rsi, -16(%rbp)	# a, a
# cacheutils.h:36:   a = (d<<32) | a;
	.loc 1 36 9
	movq	-24(%rbp), %rax	# d, tmp87
	salq	$32, %rax	#, _1
# cacheutils.h:36:   a = (d<<32) | a;
	.loc 1 36 5
	orq	%rax, -16(%rbp)	# _1, a
# cacheutils.h:37:   return a;
	.loc 1 37 10
	movq	-16(%rbp), %rax	# a, _5
# cacheutils.h:38: }
	.loc 1 38 1
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	rdtsc_begin, .-rdtsc_begin
	.globl	rdtsc_end
	.type	rdtsc_end, @function
rdtsc_end:
.LFB3:
	.loc 1 40 24
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	.cfi_offset 3, -24
# cacheutils.h:42:   asm volatile("mfence\n\t"
	.loc 1 42 3
#APP
# 42 "cacheutils.h" 1
	mfence
	RDTSCP
	mov %rdx, %rdi	# d
	mov %rax, %rsi	# a
	CPUID
	mfence
	
# 0 "" 2
#NO_APP
	movq	%rdi, -24(%rbp)	# d, d
	movq	%rsi, -16(%rbp)	# a, a
# cacheutils.h:51:   a = (d<<32) | a;
	.loc 1 51 9
	movq	-24(%rbp), %rax	# d, tmp87
	salq	$32, %rax	#, _1
# cacheutils.h:51:   a = (d<<32) | a;
	.loc 1 51 5
	orq	%rax, -16(%rbp)	# _1, a
# cacheutils.h:52:   return a;
	.loc 1 52 10
	movq	-16(%rbp), %rax	# a, _5
# cacheutils.h:53: }
	.loc 1 53 1
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE3:
	.size	rdtsc_end, .-rdtsc_end
	.globl	maccess
	.type	maccess, @function
maccess:
.LFB4:
	.loc 1 56 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# p, p
# cacheutils.h:57:   asm volatile ("movq (%0), %%rax\n"
	.loc 1 57 3
	movq	-8(%rbp), %rdx	# p, tmp82
	movq	%rdx, %rcx	# tmp82, tmp82
#APP
# 57 "cacheutils.h" 1
	movq (%rcx), %rax	# tmp82

# 0 "" 2
# cacheutils.h:61: }
	.loc 1 61 1
#NO_APP
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4:
	.size	maccess, .-maccess
	.globl	flush
	.type	flush, @function
flush:
.LFB5:
	.loc 1 63 21
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# p, p
# cacheutils.h:64:     asm volatile ("clflush 0(%0)\n"
	.loc 1 64 5
	movq	-8(%rbp), %rdx	# p, tmp82
	movq	%rdx, %rcx	# tmp82, tmp82
#APP
# 64 "cacheutils.h" 1
	clflush 0(%rcx)	# tmp82

# 0 "" 2
# cacheutils.h:68: }
	.loc 1 68 1
#NO_APP
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5:
	.size	flush, .-flush
	.globl	prefetch
	.type	prefetch, @function
prefetch:
.LFB6:
	.loc 1 71 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# p, p
# cacheutils.h:72:   asm volatile ("prefetcht1 %0" : : "m" (p));
	.loc 1 72 3
#APP
# 72 "cacheutils.h" 1
	prefetcht1 -8(%rbp)	# p
# 0 "" 2
# cacheutils.h:73: }
	.loc 1 73 1
#NO_APP
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	prefetch, .-prefetch
	.globl	longnop
	.type	longnop, @function
longnop:
.LFB7:
	.loc 1 76 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# cacheutils.h:77:   asm volatile ("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n"
	.loc 1 77 3
#APP
# 77 "cacheutils.h" 1
	nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop

# 0 "" 2
# cacheutils.h:85: }
	.loc 1 85 1
#NO_APP
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	longnop, .-longnop
	.globl	sem_union
	.bss
	.align 8
	.type	sem_union, @object
	.size	sem_union, 8
sem_union:
	.zero	8
	.local	sem_id
	.comm	sem_id,4,4
	.local	shm
	.comm	shm,8,8
	.text
	.type	semaphore_v, @function
semaphore_v:
.LFB5047:
	.file 2 "send.c"
	.loc 2 45 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# send.c:45: {
	.loc 2 45 1
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp88
	movq	%rax, -8(%rbp)	# tmp88, D.32791
	xorl	%eax, %eax	# tmp88
# send.c:48:     sem_b.sem_num = 0;
	.loc 2 48 19
	movw	$0, -14(%rbp)	#, sem_b.sem_num
# send.c:49:     sem_b.sem_op = 1;
	.loc 2 49 18
	movw	$1, -12(%rbp)	#, sem_b.sem_op
# send.c:50:     sem_b.sem_flg = SEM_UNDO;
	.loc 2 50 19
	movw	$4096, -10(%rbp)	#, sem_b.sem_flg
# send.c:51:     if (semop(sem_id, &sem_b, 1) == -1) {
	.loc 2 51 9
	movl	sem_id(%rip), %eax	# sem_id, sem_id.0_1
	leaq	-14(%rbp), %rcx	#, tmp86
	movl	$1, %edx	#,
	movq	%rcx, %rsi	# tmp86,
	movl	%eax, %edi	# sem_id.0_1,
	call	semop@PLT	#
# send.c:51:     if (semop(sem_id, &sem_b, 1) == -1) {
	.loc 2 51 8 discriminator 1
	cmpl	$-1, %eax	#, _2
	jne	.L14	#,
# send.c:52:         return -1;
	.loc 2 52 16
	movl	$-1, %eax	#, _3
	jmp	.L16	#
.L14:
# send.c:55:     return 0;
	.loc 2 55 12
	movl	$0, %eax	#, _3
.L16:
# send.c:56: }
	.loc 2 56 1
	movq	-8(%rbp), %rdx	# D.32791, tmp89
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp89
	je	.L17	#,
	call	__stack_chk_fail@PLT	#
.L17:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5047:
	.size	semaphore_v, .-semaphore_v
	.type	semaphore_p, @function
semaphore_p:
.LFB5048:
	.loc 2 59 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# send.c:59: {
	.loc 2 59 1
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp88
	movq	%rax, -8(%rbp)	# tmp88, D.32793
	xorl	%eax, %eax	# tmp88
# send.c:62:     sem_b.sem_num = 0;
	.loc 2 62 19
	movw	$0, -14(%rbp)	#, sem_b.sem_num
# send.c:63:     sem_b.sem_op = -1;
	.loc 2 63 18
	movw	$-1, -12(%rbp)	#, sem_b.sem_op
# send.c:64:     sem_b.sem_flg = SEM_UNDO;
	.loc 2 64 19
	movw	$4096, -10(%rbp)	#, sem_b.sem_flg
# send.c:65:     if (semop(sem_id, &sem_b, 1) == -1) {
	.loc 2 65 9
	movl	sem_id(%rip), %eax	# sem_id, sem_id.1_1
	leaq	-14(%rbp), %rcx	#, tmp86
	movl	$1, %edx	#,
	movq	%rcx, %rsi	# tmp86,
	movl	%eax, %edi	# sem_id.1_1,
	call	semop@PLT	#
# send.c:65:     if (semop(sem_id, &sem_b, 1) == -1) {
	.loc 2 65 8 discriminator 1
	cmpl	$-1, %eax	#, _2
	jne	.L19	#,
# send.c:66:         return -1;
	.loc 2 66 16
	movl	$-1, %eax	#, _3
	jmp	.L21	#
.L19:
# send.c:69:     return 0;
	.loc 2 69 12
	movl	$0, %eax	#, _3
.L21:
# send.c:70: }
	.loc 2 70 1
	movq	-8(%rbp), %rdx	# D.32793, tmp89
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp89
	je	.L22	#,
	call	__stack_chk_fail@PLT	#
.L22:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5048:
	.size	semaphore_p, .-semaphore_p
	.type	semaphore_init, @function
semaphore_init:
.LFB5049:
	.loc 2 73 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# send.c:74:     sem_id = semget((key_t)SEM_KEY, 0, 0666 | IPC_CREAT);
	.loc 2 74 14
	movl	$950, %edx	#,
	movl	$0, %esi	#,
	movl	$100, %edi	#,
	call	semget@PLT	#
# send.c:74:     sem_id = semget((key_t)SEM_KEY, 0, 0666 | IPC_CREAT);
	.loc 2 74 12 discriminator 1
	movl	%eax, sem_id(%rip)	# _1, sem_id
# send.c:75:     if (sem_id == -1) {
	.loc 2 75 16
	movl	sem_id(%rip), %eax	# sem_id, sem_id.2_2
# send.c:75:     if (sem_id == -1) {
	.loc 2 75 8
	cmpl	$-1, %eax	#, sem_id.2_2
	jne	.L24	#,
# send.c:76:         return -1;
	.loc 2 76 16
	movl	$-1, %eax	#, _3
	jmp	.L25	#
.L24:
# send.c:80:     return 0;
	.loc 2 80 12
	movl	$0, %eax	#, _3
.L25:
# send.c:81: }
	.loc 2 81 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5049:
	.size	semaphore_init, .-semaphore_init
	.type	sharemmy_init, @function
sharemmy_init:
.LFB5050:
	.loc 2 84 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# send.c:87:     shmid = shmget((key_t)SHM_KEY, sizeof(shared_use_t), 0666 | IPC_CREAT);
	.loc 2 87 13
	movl	$950, %edx	#,
	movl	$1532, %esi	#,
	movl	$101, %edi	#,
	call	shmget@PLT	#
	movl	%eax, -4(%rbp)	# tmp86, shmid
# send.c:88:     if (shmid == -1) {
	.loc 2 88 8
	cmpl	$-1, -4(%rbp)	#, shmid
	jne	.L27	#,
# send.c:89:         return shmid;
	.loc 2 89 16
	movl	-4(%rbp), %eax	# shmid, _3
	jmp	.L28	#
.L27:
# send.c:92:     shm = shmat(shmid, (void *)0, 0);
	.loc 2 92 11
	movl	-4(%rbp), %eax	# shmid, tmp87
	movl	$0, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# tmp87,
	call	shmat@PLT	#
# send.c:92:     shm = shmat(shmid, (void *)0, 0);
	.loc 2 92 9 discriminator 1
	movq	%rax, shm(%rip)	# _1, shm
# send.c:93:     if (shm == (void *)-1) {
	.loc 2 93 13
	movq	shm(%rip), %rax	# shm, shm.3_2
# send.c:93:     if (shm == (void *)-1) {
	.loc 2 93 8
	cmpq	$-1, %rax	#, shm.3_2
	jne	.L29	#,
# send.c:94:         return -1;
	.loc 2 94 16
	movl	$-1, %eax	#, _3
	jmp	.L28	#
.L29:
# send.c:97:     return shmid;
	.loc 2 97 12
	movl	-4(%rbp), %eax	# shmid, _3
.L28:
# send.c:98: }
	.loc 2 98 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5050:
	.size	sharemmy_init, .-sharemmy_init
	.type	sharemmy_destroy, @function
sharemmy_destroy:
.LFB5051:
	.loc 2 101 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# shmid, shmid
	movq	%rsi, -32(%rbp)	# shm, shm
# send.c:104:     rv = shmdt(shm);
	.loc 2 104 10
	movq	-32(%rbp), %rax	# shm, tmp84
	movq	%rax, %rdi	# tmp84,
	call	shmdt@PLT	#
	movl	%eax, -4(%rbp)	# tmp85, rv
# send.c:105:     if (rv == -1) {
	.loc 2 105 8
	cmpl	$-1, -4(%rbp)	#, rv
	jne	.L31	#,
# send.c:106:         return rv;
	.loc 2 106 16
	movl	-4(%rbp), %eax	# rv, _1
	jmp	.L32	#
.L31:
# send.c:109:     return 0;
	.loc 2 109 12
	movl	$0, %eax	#, _1
.L32:
# send.c:110: }
	.loc 2 110 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5051:
	.size	sharemmy_destroy, .-sharemmy_destroy
	.globl	t
	.bss
	.align 32
	.type	t, @object
	.size	t, 8000000
t:
	.zero	8000000
	.section	.rodata
.LC0:
	.string	"cpu affinity set"
	.align 8
.LC1:
	.string	"get CPU affinity failue, ERROR:%s\n"
.LC2:
	.string	"Init a semaphore fail."
.LC3:
	.string	"Init a share memory fail."
.LC4:
	.string	"time:%ld\n"
.LC5:
	.string	"Destroy share memory fail."
	.text
	.globl	main
	.type	main, @function
main:
.LFB5052:
	.loc 2 116 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r12	#
	pushq	%rbx	#
	subq	$176, %rsp	#,
	.cfi_offset 12, -24
	.cfi_offset 3, -32
# send.c:116: {
	.loc 2 116 1
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp122
	movq	%rax, -24(%rbp)	# tmp122, D.32794
	xorl	%eax, %eax	# tmp122
# send.c:117: 	int rv,i,j,z,temp = 1;
	.loc 2 117 15
	movl	$1, -176(%rbp)	#, temp
# send.c:120:     	puts("cpu affinity set");
	.loc 2 120 6
	leaq	.LC0(%rip), %rax	#, tmp98
	movq	%rax, %rdi	# tmp98,
	call	puts@PLT	#
# send.c:122:     	set_cpu(8);
	.loc 2 122 6
	movl	$8, %edi	#,
	call	set_cpu	#
# send.c:126:     	CPU_ZERO(&get);
	.loc 2 126 6
	leaq	-160(%rbp), %rax	#, tmp99
	movq	%rax, %rsi	# tmp99, tmp100
	movl	$0, %eax	#, tmp101
	movl	$16, %edx	#, tmp102
	movq	%rsi, %rdi	# tmp100, tmp100
	movq	%rdx, %rcx	# tmp102, tmp102
	rep stosq
# send.c:127:     	if (sched_getaffinity(0, sizeof(get), &get) == -1) {
	.loc 2 127 10
	leaq	-160(%rbp), %rax	#, tmp103
	movq	%rax, %rdx	# tmp103,
	movl	$128, %esi	#,
	movl	$0, %edi	#,
	call	sched_getaffinity@PLT	#
# send.c:127:     	if (sched_getaffinity(0, sizeof(get), &get) == -1) {
	.loc 2 127 9 discriminator 1
	cmpl	$-1, %eax	#, _1
	jne	.L34	#,
# send.c:128:         	printf("get CPU affinity failue, ERROR:%s\n", strerror(errno));
	.loc 2 128 65
	call	__errno_location@PLT	#
# send.c:128:         	printf("get CPU affinity failue, ERROR:%s\n", strerror(errno));
	.loc 2 128 10 discriminator 1
	movl	(%rax), %eax	# *_2, _3
	movl	%eax, %edi	# _3,
	call	strerror@PLT	#
# send.c:128:         	printf("get CPU affinity failue, ERROR:%s\n", strerror(errno));
	.loc 2 128 10 is_stmt 0 discriminator 2
	movq	%rax, %rsi	# _4,
	leaq	.LC1(%rip), %rax	#, tmp104
	movq	%rax, %rdi	# tmp104,
	movl	$0, %eax	#,
	call	printf@PLT	#
# send.c:129:         	return -1;
	.loc 2 129 17 is_stmt 1
	movl	$-1, %eax	#, _23
	jmp	.L67	#
.L34:
# send.c:134: 	rv = semaphore_init();
	.loc 2 134 7
	movl	$0, %eax	#,
	call	semaphore_init	#
	movl	%eax, -172(%rbp)	# tmp105, rv
# send.c:135:     	if (rv < 0) {
	.loc 2 135 9
	cmpl	$0, -172(%rbp)	#, rv
	jns	.L36	#,
# send.c:136:         	printf("Init a semaphore fail.\n");
	.loc 2 136 10
	leaq	.LC2(%rip), %rax	#, tmp106
	movq	%rax, %rdi	# tmp106,
	call	puts@PLT	#
# send.c:137:         	return 0;
	.loc 2 137 17
	movl	$0, %eax	#, _23
	jmp	.L67	#
.L36:
# send.c:140:     	shmid = sharemmy_init();
	.loc 2 140 14
	call	sharemmy_init	#
	movl	%eax, -168(%rbp)	# tmp107, shmid
# send.c:141:     	if (shmid == -1) {
	.loc 2 141 9
	cmpl	$-1, -168(%rbp)	#, shmid
	jne	.L37	#,
# send.c:142:         	printf("Init a share memory fail.\n");
	.loc 2 142 10
	leaq	.LC3(%rip), %rax	#, tmp108
	movq	%rax, %rdi	# tmp108,
	call	puts@PLT	#
# send.c:143:         	return 0;
	.loc 2 143 17
	movl	$0, %eax	#, _23
	jmp	.L67	#
.L37:
# send.c:147: 	semaphore_p();
	.loc 2 147 2
	movl	$0, %eax	#,
	call	semaphore_p	#
# send.c:148:     	memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);
	.loc 2 148 45
	movq	shm(%rip), %rax	# shm, shm.4_5
# send.c:148:     	memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);
	.loc 2 148 65
	movl	(%rax), %eax	# MEM[(struct shared_use_t *)shm.4_5].pktlen, _6
# send.c:148:     	memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);
	.loc 2 148 6
	cltq
# send.c:148:     	memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);
	.loc 2 148 17
	movq	shm(%rip), %rdx	# shm, shm.5_8
# send.c:148:     	memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);
	.loc 2 148 37
	leaq	4(%rdx), %rcx	#, _9
# send.c:148:     	memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);
	.loc 2 148 6
	movq	%rax, %rdx	# _7,
	movq	%rcx, %rsi	# _9,
	leaq	t(%rip), %rax	#, tmp109
	movq	%rax, %rdi	# tmp109,
	call	memcpy@PLT	#
# send.c:149: 	time3 = t[0] + 20000;
	.loc 2 149 11
	movq	t(%rip), %rax	# t[0], _10
# send.c:149: 	time3 = t[0] + 20000;
	.loc 2 149 8
	leaq	20000(%rax), %rbx	#, time3
# send.c:151:     	printf("time:%ld\n", time1);
	.loc 2 151 6
	movq	%r12, %rsi	# time1,
	leaq	.LC4(%rip), %rax	#, tmp110
	movq	%rax, %rdi	# tmp110,
	movl	$0, %eax	#,
	call	printf@PLT	#
# send.c:154: 	for(j=0;j<100000;j++){
	.loc 2 154 7
	movl	$0, -184(%rbp)	#, j
# send.c:154: 	for(j=0;j<100000;j++){
	.loc 2 154 2
	jmp	.L38	#
.L65:
# send.c:155: 		i = j % 8;
	.loc 2 155 5
	movl	-184(%rbp), %edx	# j, tmp112
	movl	%edx, %eax	# tmp112, tmp113
	sarl	$31, %eax	#, tmp113
	shrl	$29, %eax	#, tmp114
	addl	%eax, %edx	# tmp114, tmp115
	andl	$7, %edx	#, tmp116
	subl	%eax, %edx	# tmp114, tmp117
	movl	%edx, -164(%rbp)	# tmp117, i
# send.c:156:     		time2 = rdtsc();
	.loc 2 156 15
	movl	$0, %eax	#,
	call	rdtsc	#
	movq	%rax, %r12	#, time2
# send.c:157:     		while(time2 < time3) time2 = rdtsc();
	.loc 2 157 12
	jmp	.L39	#
.L40:
# send.c:157:     		while(time2 < time3) time2 = rdtsc();
	.loc 2 157 36 discriminator 2
	movl	$0, %eax	#,
	call	rdtsc	#
	movq	%rax, %r12	#, time2
.L39:
# send.c:157:     		while(time2 < time3) time2 = rdtsc();
	.loc 2 157 19 discriminator 1
	cmpq	%rbx, %r12	# time3, time2
	jb	.L40	#,
# send.c:159:     		if(i == 0) {
	.loc 2 159 9
	cmpl	$0, -164(%rbp)	#, i
	jne	.L41	#,
# send.c:160: 			for(z = 0; z < 100; z++){
	.loc 2 160 10
	movl	$0, -180(%rbp)	#, z
# send.c:160: 			for(z = 0; z < 100; z++){
	.loc 2 160 4
	jmp	.L42	#
.L43:
# send.c:160: 			for(z = 0; z < 100; z++){
	.loc 2 160 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L42:
# send.c:160: 			for(z = 0; z < 100; z++){
	.loc 2 160 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L43	#,
	jmp	.L44	#
.L41:
# send.c:163: 		} else if(i == 1) {
	.loc 2 163 12
	cmpl	$1, -164(%rbp)	#, i
	jne	.L45	#,
# send.c:164: 			for(z = 0; z < 100; z++){
	.loc 2 164 10
	movl	$0, -180(%rbp)	#, z
# send.c:164: 			for(z = 0; z < 100; z++){
	.loc 2 164 4
	jmp	.L46	#
.L47:
# send.c:164: 			for(z = 0; z < 100; z++){
	.loc 2 164 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L46:
# send.c:164: 			for(z = 0; z < 100; z++){
	.loc 2 164 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L47	#,
	jmp	.L44	#
.L45:
# send.c:167: 		} else if(i == 2) {
	.loc 2 167 12
	cmpl	$2, -164(%rbp)	#, i
	jne	.L48	#,
# send.c:168: 			for(z = 0; z < 100; z++){
	.loc 2 168 10
	movl	$0, -180(%rbp)	#, z
# send.c:168: 			for(z = 0; z < 100; z++){
	.loc 2 168 4
	jmp	.L49	#
.L50:
# send.c:168: 			for(z = 0; z < 100; z++){
	.loc 2 168 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L49:
# send.c:168: 			for(z = 0; z < 100; z++){
	.loc 2 168 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L50	#,
	jmp	.L44	#
.L48:
# send.c:171: 		}else if(i == 3) {
	.loc 2 171 11
	cmpl	$3, -164(%rbp)	#, i
	jne	.L51	#,
# send.c:172: 			for(z = 0; z < 100; z++){
	.loc 2 172 10
	movl	$0, -180(%rbp)	#, z
# send.c:172: 			for(z = 0; z < 100; z++){
	.loc 2 172 4
	jmp	.L52	#
.L53:
# send.c:172: 			for(z = 0; z < 100; z++){
	.loc 2 172 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L52:
# send.c:172: 			for(z = 0; z < 100; z++){
	.loc 2 172 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L53	#,
	jmp	.L44	#
.L51:
# send.c:175: 		}else if(i == 4) {
	.loc 2 175 11
	cmpl	$4, -164(%rbp)	#, i
	jne	.L54	#,
# send.c:176: 			for(z = 0; z < 100; z++){
	.loc 2 176 10
	movl	$0, -180(%rbp)	#, z
# send.c:176: 			for(z = 0; z < 100; z++){
	.loc 2 176 4
	jmp	.L55	#
.L56:
# send.c:176: 			for(z = 0; z < 100; z++){
	.loc 2 176 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L55:
# send.c:176: 			for(z = 0; z < 100; z++){
	.loc 2 176 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L56	#,
	jmp	.L44	#
.L54:
# send.c:179: 		}else if(i == 5) {
	.loc 2 179 11
	cmpl	$5, -164(%rbp)	#, i
	jne	.L57	#,
# send.c:180: 			for(z = 0; z < 100; z++){
	.loc 2 180 10
	movl	$0, -180(%rbp)	#, z
# send.c:180: 			for(z = 0; z < 100; z++){
	.loc 2 180 4
	jmp	.L58	#
.L59:
# send.c:180: 			for(z = 0; z < 100; z++){
	.loc 2 180 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L58:
# send.c:180: 			for(z = 0; z < 100; z++){
	.loc 2 180 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L59	#,
	jmp	.L44	#
.L57:
# send.c:183: 		}else if(i == 6) {
	.loc 2 183 11
	cmpl	$6, -164(%rbp)	#, i
	jne	.L60	#,
# send.c:184: 			for(z = 0; z < 100; z++){
	.loc 2 184 10
	movl	$0, -180(%rbp)	#, z
# send.c:184: 			for(z = 0; z < 100; z++){
	.loc 2 184 4
	jmp	.L61	#
.L62:
# send.c:184: 			for(z = 0; z < 100; z++){
	.loc 2 184 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L61:
# send.c:184: 			for(z = 0; z < 100; z++){
	.loc 2 184 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L62	#,
	jmp	.L44	#
.L60:
# send.c:188: 			for(z = 0; z < 100; z++){
	.loc 2 188 10
	movl	$0, -180(%rbp)	#, z
# send.c:188: 			for(z = 0; z < 100; z++){
	.loc 2 188 4
	jmp	.L63	#
.L64:
# send.c:188: 			for(z = 0; z < 100; z++){
	.loc 2 188 25 discriminator 3
	addl	$1, -180(%rbp)	#, z
.L63:
# send.c:188: 			for(z = 0; z < 100; z++){
	.loc 2 188 17 discriminator 1
	cmpl	$99, -180(%rbp)	#, z
	jle	.L64	#,
.L44:
# send.c:192: 		time3 += 7000;
	.loc 2 192 9
	addq	$7000, %rbx	#, time3
# send.c:154: 	for(j=0;j<100000;j++){
	.loc 2 154 20 discriminator 2
	addl	$1, -184(%rbp)	#, j
.L38:
# send.c:154: 	for(j=0;j<100000;j++){
	.loc 2 154 11 discriminator 1
	cmpl	$99999, -184(%rbp)	#, j
	jle	.L65	#,
# send.c:195: 	rv = sharemmy_destroy(shmid, shm);
	.loc 2 195 7
	movq	shm(%rip), %rdx	# shm, shm.6_11
	movl	-168(%rbp), %eax	# shmid, tmp118
	movq	%rdx, %rsi	# shm.6_11,
	movl	%eax, %edi	# tmp118,
	call	sharemmy_destroy	#
	movl	%eax, -172(%rbp)	# tmp119, rv
# send.c:196:     	if (rv < 0) {
	.loc 2 196 9
	cmpl	$0, -172(%rbp)	#, rv
	jns	.L66	#,
# send.c:197:         	printf("Destroy share memory fail.\n");
	.loc 2 197 10
	leaq	.LC5(%rip), %rax	#, tmp120
	movq	%rax, %rdi	# tmp120,
	call	puts@PLT	#
# send.c:198:         	return 0;
	.loc 2 198 17
	movl	$0, %eax	#, _23
	jmp	.L67	#
.L66:
# send.c:200: 	return 0;
	.loc 2 200 9
	movl	$0, %eax	#, _23
.L67:
# send.c:201: }
	.loc 2 201 1
	movq	-24(%rbp), %rdx	# D.32794, tmp123
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp123
	je	.L68	#,
	call	__stack_chk_fail@PLT	#
.L68:
	addq	$176, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5052:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC6:
	.string	"warning: could not set CPU affinity/n"
	.text
	.globl	set_cpu
	.type	set_cpu, @function
set_cpu:
.LFB5053:
	.loc 2 205 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$176, %rsp	#,
	movl	%edi, -164(%rbp)	# id, id
# send.c:205: {
	.loc 2 205 1
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp108
	movq	%rax, -8(%rbp)	# tmp108, D.32801
	xorl	%eax, %eax	# tmp108
# send.c:207:     CPU_ZERO(&mask);
	.loc 2 207 5
	leaq	-144(%rbp), %rax	#, tmp95
	movq	%rax, %rsi	# tmp95, tmp96
	movl	$0, %eax	#, tmp97
	movl	$16, %edx	#, tmp98
	movq	%rsi, %rdi	# tmp96, tmp96
	movq	%rdx, %rcx	# tmp98, tmp98
	rep stosq
.LBB2:
# send.c:208:     CPU_SET(id, &mask);
	.loc 2 208 5
	movl	-164(%rbp), %eax	# id, tmp100
	cltq
	movq	%rax, -152(%rbp)	# tmp99, __cpu
	cmpq	$1023, -152(%rbp)	#, __cpu
	ja	.L71	#,
# send.c:208:     CPU_SET(id, &mask);
	.loc 2 208 5 is_stmt 0 discriminator 1
	movq	-152(%rbp), %rax	# __cpu, tmp101
	shrq	$6, %rax	#, _20
	leaq	0(,%rax,8), %rdx	#, _1
	leaq	-144(%rbp), %rcx	#, tmp102
	addq	%rcx, %rdx	# tmp102, _2
	movq	(%rdx), %rdx	# *_2, _3
	movq	-152(%rbp), %rcx	# __cpu, tmp103
	andl	$63, %ecx	#, _5
	movl	$1, %esi	#, tmp104
	salq	%cl, %rsi	# _5, tmp104
	movq	%rsi, %rcx	# tmp104, _6
	leaq	0(,%rax,8), %rsi	#, _7
	leaq	-144(%rbp), %rax	#, tmp105
	addq	%rsi, %rax	# _7, _8
	orq	%rcx, %rdx	# _6, _9
	movq	%rdx, (%rax)	# _9, *_8
.L71:
.LBE2:
# send.c:209:     if (sched_setaffinity(0, sizeof(mask), &mask) == -1)
	.loc 2 209 9 is_stmt 1
	leaq	-144(%rbp), %rax	#, tmp106
	movq	%rax, %rdx	# tmp106,
	movl	$128, %esi	#,
	movl	$0, %edi	#,
	call	sched_setaffinity@PLT	#
# send.c:209:     if (sched_setaffinity(0, sizeof(mask), &mask) == -1)
	.loc 2 209 8 discriminator 1
	cmpl	$-1, %eax	#, _10
	jne	.L74	#,
# send.c:211:         fprintf(stderr, "warning: could not set CPU affinity/n");
	.loc 2 211 9
	movq	stderr(%rip), %rax	# stderr, stderr.8_11
	movq	%rax, %rcx	# stderr.8_11,
	movl	$37, %edx	#,
	movl	$1, %esi	#,
	leaq	.LC6(%rip), %rax	#, tmp107
	movq	%rax, %rdi	# tmp107,
	call	fwrite@PLT	#
.L74:
# send.c:213: }
	.loc 2 213 1
	nop	
	movq	-8(%rbp), %rax	# D.32801, tmp109
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp109
	je	.L73	#,
	call	__stack_chk_fail@PLT	#
.L73:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5053:
	.size	set_cpu, .-set_cpu
.Letext0:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/13/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"
	.file 6 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/ipc-perm.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/types/struct_semid_ds.h"
	.file 11 "/usr/include/x86_64-linux-gnu/sys/sem.h"
	.file 12 "/usr/include/stdio.h"
	.file 13 "/usr/include/sched.h"
	.file 14 "/usr/include/string.h"
	.file 15 "/usr/include/x86_64-linux-gnu/sys/shm.h"
	.file 16 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xaa9
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x16
	.long	.LASF129
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x17
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.long	.LASF9
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.long	0x43
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x92
	.byte	0x19
	.long	0x3c
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x93
	.byte	0x19
	.long	0x3c
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0x96
	.byte	0x1a
	.long	0x3c
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x5f
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x5f
	.uleb128 0x4
	.long	.LASF15
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x58
	.uleb128 0x4
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x5f
	.uleb128 0x4
	.long	.LASF17
	.byte	0x3
	.byte	0xa6
	.byte	0x19
	.long	0x58
	.uleb128 0x18
	.byte	0x8
	.uleb128 0x4
	.long	.LASF18
	.byte	0x3
	.byte	0xc7
	.byte	0x21
	.long	0x43
	.uleb128 0x5
	.long	0xe5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x12
	.long	0xe5
	.uleb128 0x4
	.long	.LASF20
	.byte	0x4
	.byte	0xd6
	.byte	0x17
	.long	0x43
	.uleb128 0x4
	.long	.LASF21
	.byte	0x5
	.byte	0x20
	.byte	0x19
	.long	0x43
	.uleb128 0x19
	.byte	0x80
	.byte	0x5
	.byte	0x27
	.byte	0x9
	.long	0x120
	.uleb128 0x1
	.long	.LASF32
	.byte	0x5
	.byte	0x29
	.byte	0xe
	.long	0x120
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0xfd
	.long	0x130
	.uleb128 0xc
	.long	0x43
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF22
	.byte	0x5
	.byte	0x2a
	.byte	0x3
	.long	0x109
	.uleb128 0x12
	.long	0x130
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF23
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF24
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF25
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF26
	.uleb128 0x5
	.long	0xec
	.uleb128 0x4
	.long	.LASF27
	.byte	0x6
	.byte	0x79
	.byte	0x11
	.long	0xc6
	.uleb128 0x4
	.long	.LASF28
	.byte	0x6
	.byte	0xa1
	.byte	0x14
	.long	0x66
	.uleb128 0x5
	.long	0x17f
	.uleb128 0x1a
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF29
	.uleb128 0x3
	.byte	0x2
	.byte	0x4
	.long	.LASF30
	.uleb128 0x3
	.byte	0x2
	.byte	0x4
	.long	.LASF31
	.uleb128 0xb
	.long	.LASF66
	.byte	0xd8
	.byte	0x7
	.byte	0x31
	.long	0x31b
	.uleb128 0x1
	.long	.LASF33
	.byte	0x7
	.byte	0x33
	.byte	0x7
	.long	0x58
	.byte	0
	.uleb128 0x1
	.long	.LASF34
	.byte	0x7
	.byte	0x36
	.byte	0x9
	.long	0xe0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF35
	.byte	0x7
	.byte	0x37
	.byte	0x9
	.long	0xe0
	.byte	0x10
	.uleb128 0x1
	.long	.LASF36
	.byte	0x7
	.byte	0x38
	.byte	0x9
	.long	0xe0
	.byte	0x18
	.uleb128 0x1
	.long	.LASF37
	.byte	0x7
	.byte	0x39
	.byte	0x9
	.long	0xe0
	.byte	0x20
	.uleb128 0x1
	.long	.LASF38
	.byte	0x7
	.byte	0x3a
	.byte	0x9
	.long	0xe0
	.byte	0x28
	.uleb128 0x1
	.long	.LASF39
	.byte	0x7
	.byte	0x3b
	.byte	0x9
	.long	0xe0
	.byte	0x30
	.uleb128 0x1
	.long	.LASF40
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.long	0xe0
	.byte	0x38
	.uleb128 0x1
	.long	.LASF41
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.long	0xe0
	.byte	0x40
	.uleb128 0x1
	.long	.LASF42
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.long	0xe0
	.byte	0x48
	.uleb128 0x1
	.long	.LASF43
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.long	0xe0
	.byte	0x50
	.uleb128 0x1
	.long	.LASF44
	.byte	0x7
	.byte	0x42
	.byte	0x9
	.long	0xe0
	.byte	0x58
	.uleb128 0x1
	.long	.LASF45
	.byte	0x7
	.byte	0x44
	.byte	0x16
	.long	0x334
	.byte	0x60
	.uleb128 0x1
	.long	.LASF46
	.byte	0x7
	.byte	0x46
	.byte	0x14
	.long	0x339
	.byte	0x68
	.uleb128 0x1
	.long	.LASF47
	.byte	0x7
	.byte	0x48
	.byte	0x7
	.long	0x58
	.byte	0x70
	.uleb128 0x1
	.long	.LASF48
	.byte	0x7
	.byte	0x49
	.byte	0x7
	.long	0x58
	.byte	0x74
	.uleb128 0x1
	.long	.LASF49
	.byte	0x7
	.byte	0x4a
	.byte	0xb
	.long	0x96
	.byte	0x78
	.uleb128 0x1
	.long	.LASF50
	.byte	0x7
	.byte	0x4d
	.byte	0x12
	.long	0x35
	.byte	0x80
	.uleb128 0x1
	.long	.LASF51
	.byte	0x7
	.byte	0x4e
	.byte	0xf
	.long	0x4a
	.byte	0x82
	.uleb128 0x1
	.long	.LASF52
	.byte	0x7
	.byte	0x4f
	.byte	0x8
	.long	0x33e
	.byte	0x83
	.uleb128 0x1
	.long	.LASF53
	.byte	0x7
	.byte	0x51
	.byte	0xf
	.long	0x34e
	.byte	0x88
	.uleb128 0x1
	.long	.LASF54
	.byte	0x7
	.byte	0x59
	.byte	0xd
	.long	0xa2
	.byte	0x90
	.uleb128 0x1
	.long	.LASF55
	.byte	0x7
	.byte	0x5b
	.byte	0x17
	.long	0x358
	.byte	0x98
	.uleb128 0x1
	.long	.LASF56
	.byte	0x7
	.byte	0x5c
	.byte	0x19
	.long	0x362
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF57
	.byte	0x7
	.byte	0x5d
	.byte	0x14
	.long	0x339
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0x5e
	.byte	0x9
	.long	0xd2
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0x5f
	.byte	0xa
	.long	0xf1
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0x60
	.byte	0x7
	.long	0x58
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF61
	.byte	0x7
	.byte	0x62
	.byte	0x8
	.long	0x367
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF62
	.byte	0x8
	.byte	0x7
	.byte	0x19
	.long	0x195
	.uleb128 0x1b
	.long	.LASF130
	.byte	0x7
	.byte	0x2b
	.byte	0xe
	.uleb128 0xd
	.long	.LASF63
	.uleb128 0x5
	.long	0x32f
	.uleb128 0x5
	.long	0x195
	.uleb128 0x9
	.long	0xe5
	.long	0x34e
	.uleb128 0xc
	.long	0x43
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x327
	.uleb128 0xd
	.long	.LASF64
	.uleb128 0x5
	.long	0x353
	.uleb128 0xd
	.long	.LASF65
	.uleb128 0x5
	.long	0x35d
	.uleb128 0x9
	.long	0xe5
	.long	0x377
	.uleb128 0xc
	.long	0x43
	.byte	0x13
	.byte	0
	.uleb128 0x5
	.long	0x31b
	.uleb128 0x1c
	.long	.LASF95
	.byte	0xc
	.byte	0x97
	.byte	0xe
	.long	0x377
	.uleb128 0xb
	.long	.LASF67
	.byte	0x30
	.byte	0x9
	.byte	0x1c
	.long	0x417
	.uleb128 0x1
	.long	.LASF68
	.byte	0x9
	.byte	0x1e
	.byte	0xb
	.long	0xc6
	.byte	0
	.uleb128 0xe
	.string	"uid"
	.byte	0x9
	.byte	0x1f
	.byte	0xb
	.long	0x72
	.byte	0x4
	.uleb128 0xe
	.string	"gid"
	.byte	0x9
	.byte	0x20
	.byte	0xb
	.long	0x7e
	.byte	0x8
	.uleb128 0x1
	.long	.LASF69
	.byte	0x9
	.byte	0x21
	.byte	0xb
	.long	0x72
	.byte	0xc
	.uleb128 0x1
	.long	.LASF70
	.byte	0x9
	.byte	0x22
	.byte	0xb
	.long	0x7e
	.byte	0x10
	.uleb128 0x1
	.long	.LASF71
	.byte	0x9
	.byte	0x23
	.byte	0xc
	.long	0x8a
	.byte	0x14
	.uleb128 0x1
	.long	.LASF72
	.byte	0x9
	.byte	0x24
	.byte	0x16
	.long	0x35
	.byte	0x18
	.uleb128 0x1
	.long	.LASF73
	.byte	0x9
	.byte	0x25
	.byte	0x16
	.long	0x35
	.byte	0x1a
	.uleb128 0x1
	.long	.LASF74
	.byte	0x9
	.byte	0x26
	.byte	0x15
	.long	0xd4
	.byte	0x20
	.uleb128 0x1
	.long	.LASF75
	.byte	0x9
	.byte	0x27
	.byte	0x15
	.long	0xd4
	.byte	0x28
	.byte	0
	.uleb128 0xb
	.long	.LASF76
	.byte	0x68
	.byte	0xa
	.byte	0x18
	.long	0x48c
	.uleb128 0x1
	.long	.LASF77
	.byte	0xa
	.byte	0x1d
	.byte	0x13
	.long	0x388
	.byte	0
	.uleb128 0x1
	.long	.LASF78
	.byte	0xa
	.byte	0x1e
	.byte	0xc
	.long	0xba
	.byte	0x30
	.uleb128 0x1
	.long	.LASF79
	.byte	0xa
	.byte	0x1f
	.byte	0x15
	.long	0xd4
	.byte	0x38
	.uleb128 0x1
	.long	.LASF80
	.byte	0xa
	.byte	0x20
	.byte	0xc
	.long	0xba
	.byte	0x40
	.uleb128 0x1
	.long	.LASF81
	.byte	0xa
	.byte	0x21
	.byte	0x15
	.long	0xd4
	.byte	0x48
	.uleb128 0x1
	.long	.LASF82
	.byte	0xa
	.byte	0x22
	.byte	0x15
	.long	0xd4
	.byte	0x50
	.uleb128 0x1
	.long	.LASF83
	.byte	0xa
	.byte	0x23
	.byte	0x15
	.long	0xd4
	.byte	0x58
	.uleb128 0x1
	.long	.LASF84
	.byte	0xa
	.byte	0x24
	.byte	0x15
	.long	0xd4
	.byte	0x60
	.byte	0
	.uleb128 0xb
	.long	.LASF85
	.byte	0x6
	.byte	0xb
	.byte	0x28
	.long	0x4c0
	.uleb128 0x1
	.long	.LASF86
	.byte	0xb
	.byte	0x2a
	.byte	0x16
	.long	0x35
	.byte	0
	.uleb128 0x1
	.long	.LASF87
	.byte	0xb
	.byte	0x2b
	.byte	0xd
	.long	0x51
	.byte	0x2
	.uleb128 0x1
	.long	.LASF88
	.byte	0xb
	.byte	0x2c
	.byte	0xd
	.long	0x51
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.byte	0x10
	.byte	0x5
	.long	.LASF89
	.uleb128 0x3
	.byte	0x10
	.byte	0x7
	.long	.LASF90
	.uleb128 0x1d
	.long	.LASF91
	.value	0x5fc
	.byte	0x2
	.byte	0x19
	.byte	0x10
	.long	0x4f7
	.uleb128 0x1
	.long	.LASF92
	.byte	0x2
	.byte	0x1a
	.byte	0x9
	.long	0x58
	.byte	0
	.uleb128 0xe
	.string	"pkt"
	.byte	0x2
	.byte	0x1b
	.byte	0x13
	.long	0x4f7
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.long	0x2e
	.long	0x508
	.uleb128 0x1e
	.long	0x43
	.value	0x5f7
	.byte	0
	.uleb128 0x4
	.long	.LASF93
	.byte	0x2
	.byte	0x1c
	.byte	0x3
	.long	0x4ce
	.uleb128 0x1f
	.long	.LASF131
	.byte	0x8
	.byte	0x2
	.byte	0x1e
	.byte	0x7
	.long	0x544
	.uleb128 0x13
	.string	"val"
	.byte	0x21
	.byte	0x5
	.long	0x58
	.uleb128 0x13
	.string	"buf"
	.byte	0x23
	.byte	0x12
	.long	0x544
	.uleb128 0x20
	.long	.LASF94
	.byte	0x2
	.byte	0x25
	.byte	0x11
	.long	0x549
	.byte	0
	.uleb128 0x5
	.long	0x417
	.uleb128 0x5
	.long	0x35
	.uleb128 0x21
	.long	.LASF96
	.byte	0x2
	.byte	0x27
	.byte	0x2
	.long	0x514
	.uleb128 0x9
	.byte	0x3
	.quad	sem_union
	.uleb128 0x7
	.long	.LASF97
	.byte	0x29
	.byte	0xc
	.long	0x58
	.uleb128 0x9
	.byte	0x3
	.quad	sem_id
	.uleb128 0x6
	.string	"shm"
	.byte	0x2
	.byte	0x2a
	.byte	0xe
	.long	0xd2
	.uleb128 0x9
	.byte	0x3
	.quad	shm
	.uleb128 0x9
	.long	0x16e
	.long	0x5a2
	.uleb128 0x22
	.long	0x43
	.long	0xf423f
	.byte	0
	.uleb128 0x23
	.string	"t"
	.byte	0x2
	.byte	0x70
	.byte	0xb
	.long	0x58f
	.uleb128 0x9
	.byte	0x3
	.quad	t
	.uleb128 0x8
	.long	.LASF98
	.byte	0xd
	.byte	0x82
	.byte	0xc
	.long	0x58
	.long	0x5d6
	.uleb128 0x2
	.long	0xae
	.uleb128 0x2
	.long	0xf1
	.uleb128 0x2
	.long	0x5d6
	.byte	0
	.uleb128 0x5
	.long	0x13c
	.uleb128 0x8
	.long	.LASF99
	.byte	0xe
	.byte	0x2b
	.byte	0xe
	.long	0xd2
	.long	0x5fb
	.uleb128 0x2
	.long	0xd2
	.uleb128 0x2
	.long	0x17a
	.uleb128 0x2
	.long	0xf1
	.byte	0
	.uleb128 0xf
	.long	.LASF100
	.byte	0xc
	.value	0x16b
	.byte	0xc
	.long	0x58
	.long	0x613
	.uleb128 0x2
	.long	0x15d
	.uleb128 0x24
	.byte	0
	.uleb128 0xf
	.long	.LASF101
	.byte	0xe
	.value	0x1a3
	.byte	0xe
	.long	0xe0
	.long	0x62a
	.uleb128 0x2
	.long	0x58
	.byte	0
	.uleb128 0x25
	.long	.LASF132
	.byte	0x10
	.byte	0x25
	.byte	0xd
	.long	0x636
	.uleb128 0x5
	.long	0x58
	.uleb128 0x8
	.long	.LASF102
	.byte	0xd
	.byte	0x86
	.byte	0xc
	.long	0x58
	.long	0x65b
	.uleb128 0x2
	.long	0xae
	.uleb128 0x2
	.long	0xf1
	.uleb128 0x2
	.long	0x65b
	.byte	0
	.uleb128 0x5
	.long	0x130
	.uleb128 0xf
	.long	.LASF103
	.byte	0xc
	.value	0x2d4
	.byte	0xc
	.long	0x58
	.long	0x677
	.uleb128 0x2
	.long	0x15d
	.byte	0
	.uleb128 0x8
	.long	.LASF104
	.byte	0xf
	.byte	0x45
	.byte	0xc
	.long	0x58
	.long	0x68d
	.uleb128 0x2
	.long	0x17a
	.byte	0
	.uleb128 0x8
	.long	.LASF105
	.byte	0xf
	.byte	0x41
	.byte	0xe
	.long	0xd2
	.long	0x6ad
	.uleb128 0x2
	.long	0x58
	.uleb128 0x2
	.long	0x17a
	.uleb128 0x2
	.long	0x58
	.byte	0
	.uleb128 0x8
	.long	.LASF106
	.byte	0xf
	.byte	0x3e
	.byte	0xc
	.long	0x58
	.long	0x6cd
	.uleb128 0x2
	.long	0x162
	.uleb128 0x2
	.long	0xf1
	.uleb128 0x2
	.long	0x58
	.byte	0
	.uleb128 0x8
	.long	.LASF107
	.byte	0xb
	.byte	0x40
	.byte	0xc
	.long	0x58
	.long	0x6ed
	.uleb128 0x2
	.long	0x162
	.uleb128 0x2
	.long	0x58
	.uleb128 0x2
	.long	0x58
	.byte	0
	.uleb128 0x8
	.long	.LASF108
	.byte	0xb
	.byte	0x43
	.byte	0xc
	.long	0x58
	.long	0x70d
	.uleb128 0x2
	.long	0x58
	.uleb128 0x2
	.long	0x70d
	.uleb128 0x2
	.long	0xf1
	.byte	0
	.uleb128 0x5
	.long	0x48c
	.uleb128 0x26
	.long	.LASF111
	.byte	0x2
	.byte	0xcc
	.byte	0x6
	.quad	.LFB5053
	.quad	.LFE5053-.LFB5053
	.uleb128 0x1
	.byte	0x9c
	.long	0x770
	.uleb128 0xa
	.string	"id"
	.byte	0x2
	.byte	0xcc
	.byte	0x12
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x7
	.long	.LASF109
	.byte	0xce
	.byte	0xf
	.long	0x130
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x27
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x7
	.long	.LASF110
	.byte	0xd0
	.byte	0x5
	.long	0xf1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF112
	.byte	0x2
	.byte	0x73
	.byte	0x5
	.long	0x58
	.quad	.LFB5052
	.quad	.LFE5052-.LFB5052
	.uleb128 0x1
	.byte	0x9c
	.long	0x82d
	.uleb128 0x6
	.string	"rv"
	.byte	0x2
	.byte	0x75
	.byte	0x6
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -188
	.uleb128 0x6
	.string	"i"
	.byte	0x2
	.byte	0x75
	.byte	0x9
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x6
	.string	"j"
	.byte	0x2
	.byte	0x75
	.byte	0xb
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x6
	.string	"z"
	.byte	0x2
	.byte	0x75
	.byte	0xd
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -196
	.uleb128 0x7
	.long	.LASF113
	.byte	0x75
	.byte	0xf
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x7
	.long	.LASF114
	.byte	0x76
	.byte	0xa
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x7
	.long	.LASF115
	.byte	0x77
	.byte	0x19
	.long	0x16e
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x7
	.long	.LASF116
	.byte	0x77
	.byte	0x20
	.long	0x16e
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x7
	.long	.LASF117
	.byte	0x77
	.byte	0x27
	.long	0x16e
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x6
	.string	"get"
	.byte	0x2
	.byte	0x7b
	.byte	0x10
	.long	0x130
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x29
	.long	.LASF133
	.byte	0x2
	.byte	0x7c
	.byte	0x10
	.long	0x82d
	.byte	0
	.uleb128 0x5
	.long	0x508
	.uleb128 0x14
	.long	.LASF118
	.byte	0x64
	.long	0x58
	.quad	.LFB5051
	.quad	.LFE5051-.LFB5051
	.uleb128 0x1
	.byte	0x9c
	.long	0x87f
	.uleb128 0x2a
	.long	.LASF114
	.byte	0x2
	.byte	0x64
	.byte	0x21
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.string	"shm"
	.byte	0x2
	.byte	0x64
	.byte	0x2e
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x6
	.string	"rv"
	.byte	0x2
	.byte	0x66
	.byte	0x9
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.long	.LASF119
	.byte	0x53
	.long	0x58
	.quad	.LFB5050
	.quad	.LFE5050-.LFB5050
	.uleb128 0x1
	.byte	0x9c
	.long	0x8ae
	.uleb128 0x7
	.long	.LASF114
	.byte	0x55
	.byte	0x9
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2b
	.long	.LASF134
	.byte	0x2
	.byte	0x48
	.byte	0xc
	.long	0x58
	.quad	.LFB5049
	.quad	.LFE5049-.LFB5049
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF121
	.byte	0x3a
	.long	0x58
	.quad	.LFB5048
	.quad	.LFE5048-.LFB5048
	.uleb128 0x1
	.byte	0x9c
	.long	0x8fb
	.uleb128 0x7
	.long	.LASF120
	.byte	0x3c
	.byte	0x13
	.long	0x48c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x15
	.long	.LASF122
	.byte	0x2c
	.long	0x58
	.quad	.LFB5047
	.quad	.LFE5047-.LFB5047
	.uleb128 0x1
	.byte	0x9c
	.long	0x92a
	.uleb128 0x7
	.long	.LASF120
	.byte	0x2e
	.byte	0x13
	.long	0x48c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x2c
	.long	.LASF135
	.byte	0x1
	.byte	0x4b
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.long	.LASF123
	.byte	0x46
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x96e
	.uleb128 0xa
	.string	"p"
	.byte	0x1
	.byte	0x46
	.byte	0x15
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF124
	.byte	0x3f
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x998
	.uleb128 0xa
	.string	"p"
	.byte	0x1
	.byte	0x3f
	.byte	0x12
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF125
	.byte	0x37
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x9c2
	.uleb128 0xa
	.string	"p"
	.byte	0x1
	.byte	0x37
	.byte	0x14
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.long	.LASF126
	.byte	0x28
	.long	0x66
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x9fd
	.uleb128 0x6
	.string	"a"
	.byte	0x1
	.byte	0x29
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.string	"d"
	.byte	0x1
	.byte	0x29
	.byte	0x11
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x11
	.long	.LASF127
	.byte	0x19
	.long	0x66
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xa38
	.uleb128 0x6
	.string	"a"
	.byte	0x1
	.byte	0x1a
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.string	"d"
	.byte	0x1
	.byte	0x1a
	.byte	0x11
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x11
	.long	.LASF128
	.byte	0x10
	.long	0x66
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xa73
	.uleb128 0x6
	.string	"a"
	.byte	0x1
	.byte	0x11
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.string	"d"
	.byte	0x1
	.byte	0x11
	.byte	0x11
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2d
	.long	.LASF136
	.byte	0x1
	.byte	0x9
	.byte	0xc
	.long	0x66
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.string	"a"
	.byte	0x1
	.byte	0xa
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.string	"d"
	.byte	0x1
	.byte	0xa
	.byte	0x11
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF100:
	.string	"printf"
.LASF13:
	.string	"__off_t"
.LASF11:
	.string	"__gid_t"
.LASF34:
	.string	"_IO_read_ptr"
.LASF46:
	.string	"_chain"
.LASF80:
	.string	"sem_ctime"
.LASF20:
	.string	"size_t"
.LASF108:
	.string	"semop"
.LASF52:
	.string	"_shortbuf"
.LASF91:
	.string	"shared_use"
.LASF81:
	.string	"__sem_ctime_high"
.LASF76:
	.string	"semid_ds"
.LASF40:
	.string	"_IO_buf_base"
.LASF121:
	.string	"semaphore_p"
.LASF25:
	.string	"long long unsigned int"
.LASF127:
	.string	"rdtsc_begin"
.LASF55:
	.string	"_codecvt"
.LASF119:
	.string	"sharemmy_init"
.LASF23:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF123:
	.string	"prefetch"
.LASF12:
	.string	"__mode_t"
.LASF17:
	.string	"__key_t"
.LASF32:
	.string	"__bits"
.LASF47:
	.string	"_fileno"
.LASF35:
	.string	"_IO_read_end"
.LASF8:
	.string	"long int"
.LASF33:
	.string	"_flags"
.LASF77:
	.string	"sem_perm"
.LASF41:
	.string	"_IO_buf_end"
.LASF50:
	.string	"_cur_column"
.LASF64:
	.string	"_IO_codecvt"
.LASF29:
	.string	"double"
.LASF49:
	.string	"_old_offset"
.LASF54:
	.string	"_offset"
.LASF94:
	.string	"array"
.LASF106:
	.string	"shmget"
.LASF104:
	.string	"shmdt"
.LASF96:
	.string	"sem_union"
.LASF109:
	.string	"mask"
.LASF87:
	.string	"sem_op"
.LASF113:
	.string	"temp"
.LASF74:
	.string	"__glibc_reserved1"
.LASF97:
	.string	"sem_id"
.LASF63:
	.string	"_IO_marker"
.LASF4:
	.string	"unsigned int"
.LASF27:
	.string	"key_t"
.LASF58:
	.string	"_freeres_buf"
.LASF89:
	.string	"__int128"
.LASF7:
	.string	"short int"
.LASF5:
	.string	"long unsigned int"
.LASF85:
	.string	"sembuf"
.LASF38:
	.string	"_IO_write_ptr"
.LASF135:
	.string	"longnop"
.LASF107:
	.string	"semget"
.LASF102:
	.string	"sched_getaffinity"
.LASF28:
	.string	"u_int64_t"
.LASF42:
	.string	"_IO_save_base"
.LASF129:
	.string	"GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -O0 -fno-inline -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF72:
	.string	"__seq"
.LASF69:
	.string	"cuid"
.LASF53:
	.string	"_lock"
.LASF60:
	.string	"_mode"
.LASF118:
	.string	"sharemmy_destroy"
.LASF67:
	.string	"ipc_perm"
.LASF56:
	.string	"_wide_data"
.LASF103:
	.string	"puts"
.LASF126:
	.string	"rdtsc_end"
.LASF136:
	.string	"rdtsc_nofence"
.LASF30:
	.string	"_Float16"
.LASF134:
	.string	"semaphore_init"
.LASF39:
	.string	"_IO_write_end"
.LASF18:
	.string	"__syscall_ulong_t"
.LASF130:
	.string	"_IO_lock_t"
.LASF133:
	.string	"shared"
.LASF66:
	.string	"_IO_FILE"
.LASF78:
	.string	"sem_otime"
.LASF9:
	.string	"__uint64_t"
.LASF26:
	.string	"float"
.LASF93:
	.string	"shared_use_t"
.LASF45:
	.string	"_markers"
.LASF111:
	.string	"set_cpu"
.LASF2:
	.string	"unsigned char"
.LASF15:
	.string	"__pid_t"
.LASF48:
	.string	"_flags2"
.LASF51:
	.string	"_vtable_offset"
.LASF62:
	.string	"FILE"
.LASF122:
	.string	"semaphore_v"
.LASF125:
	.string	"maccess"
.LASF21:
	.string	"__cpu_mask"
.LASF88:
	.string	"sem_flg"
.LASF98:
	.string	"sched_setaffinity"
.LASF128:
	.string	"rdtsc"
.LASF24:
	.string	"long double"
.LASF19:
	.string	"char"
.LASF71:
	.string	"mode"
.LASF110:
	.string	"__cpu"
.LASF75:
	.string	"__glibc_reserved2"
.LASF31:
	.string	"__bf16"
.LASF16:
	.string	"__time_t"
.LASF115:
	.string	"time1"
.LASF116:
	.string	"time2"
.LASF117:
	.string	"time3"
.LASF92:
	.string	"pktlen"
.LASF132:
	.string	"__errno_location"
.LASF82:
	.string	"sem_nsems"
.LASF10:
	.string	"__uid_t"
.LASF14:
	.string	"__off64_t"
.LASF79:
	.string	"__sem_otime_high"
.LASF36:
	.string	"_IO_read_base"
.LASF99:
	.string	"memcpy"
.LASF44:
	.string	"_IO_save_end"
.LASF3:
	.string	"short unsigned int"
.LASF73:
	.string	"__pad2"
.LASF59:
	.string	"__pad5"
.LASF124:
	.string	"flush"
.LASF61:
	.string	"_unused2"
.LASF95:
	.string	"stderr"
.LASF83:
	.string	"__glibc_reserved3"
.LASF84:
	.string	"__glibc_reserved4"
.LASF105:
	.string	"shmat"
.LASF131:
	.string	"semun"
.LASF68:
	.string	"__key"
.LASF86:
	.string	"sem_num"
.LASF114:
	.string	"shmid"
.LASF120:
	.string	"sem_b"
.LASF43:
	.string	"_IO_backup_base"
.LASF22:
	.string	"cpu_set_t"
.LASF57:
	.string	"_freeres_list"
.LASF65:
	.string	"_IO_wide_data"
.LASF101:
	.string	"strerror"
.LASF70:
	.string	"cgid"
.LASF112:
	.string	"main"
.LASF37:
	.string	"_IO_write_base"
.LASF90:
	.string	"__int128 unsigned"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/upgautam/CLionProjects/retirement/covert_channel_assembly_learning"
.LASF0:
	.string	"send.c"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
