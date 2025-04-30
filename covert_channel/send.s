	.file	"send.c"
	.text
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
	.string	"Warning: CPU affinity check failed, continuing anyway\n"
.LC2:
	.string	"Semaphore get"
.LC3:
	.string	"Init semaphore failed."
.LC4:
	.string	"share memory init"
.LC5:
	.string	"Init shared memory failed."
.LC6:
	.string	"time:%ld\n"
.LC7:
	.string	"Destroy shared memory failed."
	.text
	.globl	main
	.type	main, @function
main:
.LFB5039:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$16, %edi
	call	set_cpu@PLT
	call	check_cpu_affinity@PLT
	testl	%eax, %eax
	jns	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L2:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	semaphore_get@PLT
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L3
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L4
.L3:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	sharemmy_init@PLT
	movl	%eax, -24(%rbp)
	cmpl	$-1, -24(%rbp)
	jne	.L5
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L4
.L5:
	call	semaphore_p@PLT
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	cltq
	movq	shm(%rip), %rdx
	leaq	4(%rdx), %rcx
	movq	%rax, %rdx
	movq	%rcx, %rsi
	leaq	t(%rip), %rax
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	t(%rip), %rax
	leaq	20000(%rax), %rbx
	movq	%rbx, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -36(%rbp)
	jmp	.L6
.L33:
	movl	-36(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%eax, %edx
	andl	$7, %edx
	subl	%eax, %edx
	movl	%edx, -20(%rbp)
	call	rdtsc@PLT
	movq	%rax, %r12
	jmp	.L7
.L8:
	call	rdtsc@PLT
	movq	%rax, %r12
.L7:
	cmpq	%rbx, %r12
	jb	.L8
	cmpl	$0, -20(%rbp)
	jne	.L9
	movl	$0, -32(%rbp)
	jmp	.L10
.L11:
	addl	$1, -32(%rbp)
.L10:
	cmpl	$99, -32(%rbp)
	jle	.L11
	jmp	.L12
.L9:
	cmpl	$1, -20(%rbp)
	jne	.L13
	movl	$0, -32(%rbp)
	jmp	.L14
.L15:
	addl	$1, -32(%rbp)
.L14:
	cmpl	$99, -32(%rbp)
	jle	.L15
	jmp	.L12
.L13:
	cmpl	$2, -20(%rbp)
	jne	.L16
	movl	$0, -32(%rbp)
	jmp	.L17
.L18:
	addl	$1, -32(%rbp)
.L17:
	cmpl	$99, -32(%rbp)
	jle	.L18
	jmp	.L12
.L16:
	cmpl	$3, -20(%rbp)
	jne	.L19
	movl	$0, -32(%rbp)
	jmp	.L20
.L21:
	addl	$1, -32(%rbp)
.L20:
	cmpl	$99, -32(%rbp)
	jle	.L21
	jmp	.L12
.L19:
	cmpl	$4, -20(%rbp)
	jne	.L22
	movl	$0, -32(%rbp)
	jmp	.L23
.L24:
	addl	$1, -32(%rbp)
.L23:
	cmpl	$99, -32(%rbp)
	jle	.L24
	jmp	.L12
.L22:
	cmpl	$5, -20(%rbp)
	jne	.L25
	movl	$0, -32(%rbp)
	jmp	.L26
.L27:
	addl	$1, -32(%rbp)
.L26:
	cmpl	$99, -32(%rbp)
	jle	.L27
	jmp	.L12
.L25:
	cmpl	$6, -20(%rbp)
	jne	.L28
	movl	$0, -32(%rbp)
	jmp	.L29
.L30:
	addl	$1, -32(%rbp)
.L29:
	cmpl	$99, -32(%rbp)
	jle	.L30
	jmp	.L12
.L28:
	movl	$0, -32(%rbp)
	jmp	.L31
.L32:
	addl	$1, -32(%rbp)
.L31:
	cmpl	$99, -32(%rbp)
	jle	.L32
.L12:
	addq	$7000, %rbx
	addl	$1, -36(%rbp)
.L6:
	cmpl	$99999, -36(%rbp)
	jle	.L33
	movq	shm(%rip), %rdx
	movl	-24(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	sharemmy_destroy@PLT
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L34
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L4
.L34:
	movl	$0, %eax
.L4:
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5039:
	.size	main, .-main
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
