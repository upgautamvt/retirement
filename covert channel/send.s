	.file	"send.c"
	.text
	.globl	rdtsc_nofence
	.type	rdtsc_nofence, @function
rdtsc_nofence:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 11 "cacheutils.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	rdtsc_nofence, .-rdtsc_nofence
	.globl	rdtsc
	.type	rdtsc, @function
rdtsc:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 18 "cacheutils.h" 1
	mfence
# 0 "" 2
# 19 "cacheutils.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
#APP
# 21 "cacheutils.h" 1
	mfence
# 0 "" 2
#NO_APP
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	rdtsc, .-rdtsc
	.globl	rdtsc_begin
	.type	rdtsc_begin, @function
rdtsc_begin:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
#APP
# 27 "cacheutils.h" 1
	mfence
	CPUID
	RDTSCP
	mov %rdx, %rdi
	mov %rax, %rsi
	mfence
	
# 0 "" 2
#NO_APP
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-24(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	rdtsc_begin, .-rdtsc_begin
	.globl	rdtsc_end
	.type	rdtsc_end, @function
rdtsc_end:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
#APP
# 42 "cacheutils.h" 1
	mfence
	RDTSCP
	mov %rdx, %rdi
	mov %rax, %rsi
	CPUID
	mfence
	
# 0 "" 2
#NO_APP
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-24(%rbp), %rax
	salq	$32, %rax
	orq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	rdtsc_end, .-rdtsc_end
	.globl	maccess
	.type	maccess, @function
maccess:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, %rcx
#APP
# 57 "cacheutils.h" 1
	movq (%rcx), %rax

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	maccess, .-maccess
	.globl	flush
	.type	flush, @function
flush:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, %rcx
#APP
# 64 "cacheutils.h" 1
	clflush 0(%rcx)

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	flush, .-flush
	.globl	prefetch
	.type	prefetch, @function
prefetch:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
#APP
# 72 "cacheutils.h" 1
	prefetcht1 -8(%rbp)
# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	prefetch, .-prefetch
	.globl	longnop
	.type	longnop, @function
longnop:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
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
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	longnop, .-longnop
	.comm	sem_union,8,8
	.local	sem_id
	.comm	sem_id,4,4
	.local	shm
	.comm	shm,8,8
	.type	semaphore_v, @function
semaphore_v:
.LFB4270:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$0, -14(%rbp)
	movw	$1, -12(%rbp)
	movw	$4096, -10(%rbp)
	movl	sem_id(%rip), %eax
	leaq	-14(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	semop@PLT
	cmpl	$-1, %eax
	jne	.L14
	movl	$-1, %eax
	jmp	.L16
.L14:
	movl	$0, %eax
.L16:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4270:
	.size	semaphore_v, .-semaphore_v
	.type	semaphore_p, @function
semaphore_p:
.LFB4271:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$0, -14(%rbp)
	movw	$-1, -12(%rbp)
	movw	$4096, -10(%rbp)
	movl	sem_id(%rip), %eax
	leaq	-14(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	semop@PLT
	cmpl	$-1, %eax
	jne	.L19
	movl	$-1, %eax
	jmp	.L21
.L19:
	movl	$0, %eax
.L21:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4271:
	.size	semaphore_p, .-semaphore_p
	.type	semaphore_init, @function
semaphore_init:
.LFB4272:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$950, %edx
	movl	$0, %esi
	movl	$100, %edi
	call	semget@PLT
	movl	%eax, sem_id(%rip)
	movl	sem_id(%rip), %eax
	cmpl	$-1, %eax
	jne	.L24
	movl	$-1, %eax
	jmp	.L25
.L24:
	movl	$0, %eax
.L25:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4272:
	.size	semaphore_init, .-semaphore_init
	.type	sharemmy_init, @function
sharemmy_init:
.LFB4273:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$950, %edx
	movl	$1532, %esi
	movl	$101, %edi
	call	shmget@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L27
	movl	-4(%rbp), %eax
	jmp	.L28
.L27:
	movl	-4(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmat@PLT
	movq	%rax, shm(%rip)
	movq	shm(%rip), %rax
	cmpq	$-1, %rax
	jne	.L29
	movl	$-1, %eax
	jmp	.L28
.L29:
	movl	-4(%rbp), %eax
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4273:
	.size	sharemmy_init, .-sharemmy_init
	.type	sharemmy_destroy, @function
sharemmy_destroy:
.LFB4274:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	shmdt@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L31
	movl	-4(%rbp), %eax
	jmp	.L32
.L31:
	movl	$0, %eax
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4274:
	.size	sharemmy_destroy, .-sharemmy_destroy
	.comm	t,8000000,32
	.globl	data
	.bss
	.align 4
	.type	data, @object
	.size	data, 4
data:
	.zero	4
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
.LFB4275:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$176, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$1, -176(%rbp)
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$8, %edi
	call	set_cpu
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	leaq	-160(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_getaffinity@PLT
	cmpl	$-1, %eax
	jne	.L34
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L67
.L34:
	movl	$0, %eax
	call	semaphore_init
	movl	%eax, -172(%rbp)
	cmpl	$0, -172(%rbp)
	jns	.L36
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L67
.L36:
	call	sharemmy_init
	movl	%eax, -168(%rbp)
	cmpl	$-1, -168(%rbp)
	jne	.L37
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L67
.L37:
	movl	$0, %eax
	call	semaphore_p
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	cltq
	movq	shm(%rip), %rdx
	leaq	4(%rdx), %rcx
	movq	%rax, %rdx
	movq	%rcx, %rsi
	leaq	t(%rip), %rdi
	call	memcpy@PLT
	movq	t(%rip), %rax
	leaq	20000(%rax), %rbx
	movq	%r12, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -184(%rbp)
	jmp	.L38
.L65:
	movl	-184(%rbp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	movl	%eax, -164(%rbp)
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %r12
	jmp	.L39
.L40:
	movl	$0, %eax
	call	rdtsc
	movq	%rax, %r12
.L39:
	cmpq	%rbx, %r12
	jb	.L40
	cmpl	$0, -164(%rbp)
	jne	.L41
	
	
	movl	$0, %eax
	jmp	.L42
	.align	32
.L43:
	adcl	$1, -180(%rbp)
	addl	$1, %eax
.L42:
	cmpl	$329, %eax
	jle	.L43
	jmp	.L44
.L41:
	cmpl	$1, -164(%rbp)
	jne	.L45
	
	movl	$0, %eax
	jmp	.L46
	.align	32
.L47:
	xchg	%ecx, -180(%rbp)
	nop
	addl	$1, %eax
.L46:
	cmpl	$159, %eax
	jle	.L47
	jmp	.L44
.L45:
	cmpl	$2, -164(%rbp)
	jne	.L48
	
	movl	$0, %eax
	jmp	.L49
	.align	32
.L50:
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
	addl	$1, %eax
.L49:
	cmpl	$399, %eax
	jle	.L50
	
	jmp	.L44
.L48:
	cmpl	$3, -164(%rbp)
	jne	.L51
	
	movl	$0, %eax
	jmp	.L52
	.align	32
.L53:
	xchg	%ecx, -180(%rbp)
	addl	$1, -180(%rbp)
	addl	$1, %eax
.L52:
	cmpl	$29, %eax
	jle	.L53
	
	jmp	.L44
.L51:
	cmpl	$4, -164(%rbp)
	jne	.L54
	
	movl	$0, %eax
	jmp	.L55
	.align	32
.L56:
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
	addl	$1, -180(%rbp)
	addl	$1, %eax
.L55:
	cmpl	$399, %eax
	jle	.L56
	
	jmp	.L44
.L54:
	cmpl	$5, -164(%rbp)
	jne	.L57
	
	movl	$0, %eax
	jmp	.L58
	.align	32
.L59:
	addl	$1, -180(%rbp)
	addl	$1, %eax
.L58:
	cmpl	$249, %eax
	jle	.L59
	
	jmp	.L44
.L57:
	cmpl	$6, -164(%rbp)
	jne	.L60
	
	movl	$0, %eax
	jmp	.L61
	.align	32
.L62:
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
	adcl	$1, -180(%rbp)
	addl	$1, %eax
.L61:
	cmpl	$259, %eax
	jle	.L62
	
	jmp	.L44
.L60:
	movl	$0, %eax
	jmp	.L63
	.align	32
.L64:
	nopw   %cs:0x123123(%rax,%rax,1)
	.align	32
	nopw   %cs:0x123123(%rax,%rax,1)
	.align	32
	nopw   %cs:0x123123(%rax,%rax,1)
	addl	$1, -180(%rbp)
	addl	$1, %eax
.L63:
	cmpl	$334, %eax
	jle	.L64
.L44:
	addq	$7000, %rbx
	addl	$1, -184(%rbp)
.L38:
	cmpl	$99999, -184(%rbp)
	jle	.L65
	movq	shm(%rip), %rdx
	movl	-168(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	sharemmy_destroy
	movl	%eax, -172(%rbp)
	cmpl	$0, -172(%rbp)
	jns	.L66
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L67
.L66:
	movl	$0, %eax
.L67:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L68
	call	__stack_chk_fail@PLT
.L68:
	addq	$176, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4275:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC6:
	.string	"warning: could not set CPU affinity/n"
	.text
	.globl	set_cpu
	.type	set_cpu, @function
set_cpu:
.LFB4276:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	movl	-164(%rbp), %eax
	cltq
	movq	%rax, -152(%rbp)
	cmpq	$1023, -152(%rbp)
	ja	.L71
	movq	-152(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-144(%rbp), %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movq	-152(%rbp), %rcx
	andl	$63, %ecx
	movl	$1, %esi
	salq	%cl, %rsi
	movq	%rsi, %rcx
	leaq	0(,%rax,8), %rsi
	leaq	-144(%rbp), %rax
	addq	%rsi, %rax
	orq	%rcx, %rdx
	movq	%rdx, (%rax)
.L71:
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	cmpl	$-1, %eax
	jne	.L74
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
.L74:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L73
	call	__stack_chk_fail@PLT
.L73:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4276:
	.size	set_cpu, .-set_cpu
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
