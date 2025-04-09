	.file	"result.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"re0.txt"
.LC2:
	.string	"%ld"
.LC3:
	.string	"result:%d, %d\n"
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
	movq	%rax, -8000024(%rbp)
	movl	$0, -8000068(%rbp)
	movl	$0, -8000064(%rbp)
	movl	$0, -8000060(%rbp)
	movl	$0, -8000056(%rbp)
	movl	$0, -8000052(%rbp)
	movl	$20, -8000036(%rbp)
	movl	$1, -8000032(%rbp)
	movl	$0, -8000048(%rbp)
	jmp	.L2
.L3:
	leaq	-8000016(%rbp), %rax
	movl	-8000048(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8000024(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, -8000048(%rbp)
.L2:
	cmpl	$799999, -8000048(%rbp)
	jle	.L3
	movl	$5, -8000028(%rbp)
	movl	$3000, -8000044(%rbp)
	jmp	.L4
.L14:
	movl	$0, -8000064(%rbp)
	movl	$0, -8000056(%rbp)
	movl	$0, -8000052(%rbp)
	jmp	.L5
.L11:
	movl	$1, -8000040(%rbp)
	jmp	.L6
.L10:
	movl	-8000044(%rbp), %eax
	imull	-8000028(%rbp), %eax
	imull	-8000036(%rbp), %eax
	movl	%eax, %edx
	movl	-8000040(%rbp), %eax
	addl	%eax, %edx
	movl	-8000036(%rbp), %eax
	imull	-8000052(%rbp), %eax
	addl	%edx, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$790, %rax
	jle	.L7
	movl	-8000044(%rbp), %eax
	imull	-8000028(%rbp), %eax
	imull	-8000036(%rbp), %eax
	movl	%eax, %edx
	movl	-8000040(%rbp), %eax
	addl	%eax, %edx
	movl	-8000036(%rbp), %eax
	imull	-8000052(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$789, %rax
	jg	.L7
	addl	$1, -8000064(%rbp)
	movl	-8000044(%rbp), %eax
	imull	-8000028(%rbp), %eax
	imull	-8000036(%rbp), %eax
	movl	%eax, %edx
	movl	-8000040(%rbp), %eax
	addl	%edx, %eax
	leal	-1(%rax), %edx
	movl	-8000036(%rbp), %eax
	imull	-8000052(%rbp), %eax
	addl	%edx, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$664, %rax
	jg	.L17
	addl	$1, -8000056(%rbp)
	jmp	.L17
.L7:
	addl	$1, -8000040(%rbp)
.L6:
	cmpl	$9, -8000040(%rbp)
	jle	.L10
	jmp	.L9
.L17:
	nop
.L9:
	addl	$1, -8000052(%rbp)
.L5:
	movl	-8000052(%rbp), %eax
	cmpl	-8000028(%rbp), %eax
	jl	.L11
	cmpl	$0, -8000064(%rbp)
	je	.L18
	addl	$1, -8000068(%rbp)
	movl	-8000056(%rbp), %eax
	cmpl	-8000032(%rbp), %eax
	jle	.L13
	addl	$1, -8000060(%rbp)
	jmp	.L13
.L18:
	nop
.L13:
	addl	$1, -8000044(%rbp)
.L4:
	cmpl	$6999, -8000044(%rbp)
	jle	.L14
	movl	-8000068(%rbp), %edx
	movl	-8000060(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
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
