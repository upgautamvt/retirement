	.file	"analyze.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"re0.txt"
.LC2:
	.string	"%ld"
.LC3:
	.string	"result:%d, %ld, %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-7999488(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$592, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8000032(%rbp)
	movl	$0, -8000068(%rbp)
	movl	$0, -8000048(%rbp)
	movl	$0, -8000044(%rbp)
	movq	$0, -8000024(%rbp)
	movq	$0, -8000040(%rbp)
	movl	$0, -8000064(%rbp)
	movl	$0, -8000060(%rbp)
	jmp	.L2
.L3:
	leaq	-8000016(%rbp), %rax
	movl	-8000060(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8000032(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, -8000060(%rbp)
.L2:
	cmpl	$799999, -8000060(%rbp)
	jle	.L3
	movl	$10000, -8000056(%rbp)
	jmp	.L4
.L10:
	movl	$1, -8000052(%rbp)
	jmp	.L5
.L9:
	movl	-8000056(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	-8000052(%rbp), %eax
	addl	%edx, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$750, %rax
	jle	.L6
	movl	-8000056(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	-8000052(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$749, %rax
	jg	.L6
	addl	$1, -8000068(%rbp)
	movl	-8000056(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	-8000052(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	addq	%rax, -8000040(%rbp)
	movl	-8000056(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	-8000052(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, -8000024(%rbp)
	cmpq	$669, -8000024(%rbp)
	jg	.L13
	addl	$1, -8000064(%rbp)
	jmp	.L13
.L6:
	addl	$1, -8000052(%rbp)
.L5:
	cmpl	$9, -8000052(%rbp)
	jle	.L9
	jmp	.L8
.L13:
	nop
.L8:
	addl	$1, -8000056(%rbp)
.L4:
	cmpl	$39999, -8000056(%rbp)
	jle	.L10
	movl	-8000068(%rbp), %eax
	movslq	%eax, %rcx
	movq	-8000040(%rbp), %rax
	cqto
	idivq	%rcx
	movq	%rax, %rsi
	movl	-8000064(%rbp), %edx
	movl	-8000068(%rbp), %eax
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
