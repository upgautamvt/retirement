	.file	"receive.c"
	.text
	.section	.rodata
.LC0:
	.string	"cpu affinity set"
	.align 8
.LC1:
	.string	"Warning: CPU affinity check failed, continuing anyway\n"
.LC2:
	.string	"Semaphore Init"
.LC3:
	.string	"Init semaphore failed."
.LC4:
	.string	"share memory Init"
.LC5:
	.string	"Init shared memory failed."
.LC6:
	.string	"time: %lu\n"
.LC7:
	.string	"%ld\n"
.LC8:
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
	leaq	-7999488(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$560, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %edi
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
	call	semaphore_init@PLT
	movl	%eax, -8000048(%rbp)
	cmpl	$0, -8000048(%rbp)
	jns	.L3
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L15
.L3:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	sharemmy_init@PLT
	movl	%eax, -8000044(%rbp)
	cmpl	$-1, -8000044(%rbp)
	jne	.L5
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L15
.L5:
	call	rdtsc@PLT
	movq	%rax, -8000032(%rbp)
	movq	shm(%rip), %rax
	movq	%rax, -8000040(%rbp)
	movq	-8000040(%rbp), %rax
	movl	$8, (%rax)
	movq	-8000040(%rbp), %rax
	leaq	4(%rax), %rdx
	movq	-8000032(%rbp), %rax
	movq	%rax, (%rdx)
	call	semaphore_v@PLT
	movq	-8000032(%rbp), %rax
	leaq	20000(%rax), %rbx
	movq	%rbx, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -8000056(%rbp)
	jmp	.L6
.L11:
	call	rdtsc@PLT
	movq	%rax, %r12
	jmp	.L7
.L8:
	call	rdtsc@PLT
	movq	%rax, %r12
.L7:
	cmpq	%rbx, %r12
	jb	.L8
	call	rdtsc@PLT
	movq	%rax, %r12
	movl	$0, -8000052(%rbp)
	jmp	.L9
.L10:
	addl	$1, -8000052(%rbp)
.L9:
	cmpl	$99, -8000052(%rbp)
	jle	.L10
	call	rdtsc@PLT
	subq	%r12, %rax
	movq	%rax, %rdx
	movl	-8000056(%rbp), %eax
	cltq
	movq	%rdx, -8000032(%rbp,%rax,8)
	addq	$7000, %rbx
	addl	$1, -8000056(%rbp)
.L6:
	cmpl	$99999, -8000056(%rbp)
	jle	.L11
	movl	$0, -8000056(%rbp)
	jmp	.L12
.L13:
	movl	-8000056(%rbp), %eax
	cltq
	movq	-8000032(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8000056(%rbp)
.L12:
	cmpl	$99999, -8000056(%rbp)
	jle	.L13
	movq	shm(%rip), %rdx
	movl	-8000044(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	sharemmy_destroy@PLT
	movl	%eax, -8000048(%rbp)
	cmpl	$0, -8000048(%rbp)
	jns	.L14
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L15
.L14:
	movl	$1, %eax
.L15:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	addq	$8000048, %rsp
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
