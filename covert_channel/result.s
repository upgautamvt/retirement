	.file	"result.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"re.txt"
.LC2:
	.string	"%ld"
.LC3:
	.string	"0, %ld\n"
.LC4:
	.string	"1, %ld\n"
.LC5:
	.string	"2, %ld\n"
.LC6:
	.string	"3, %ld\n"
.LC7:
	.string	"4, %ld\n"
.LC8:
	.string	"5, %ld\n"
.LC9:
	.string	"6, %ld\n"
.LC10:
	.string	"7, %ld\n"
.LC11:
	.string	"result:%d\n"
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
	subq	$640, %rsp
	movl	%edi, -8000116(%rbp)
	movq	%rsi, -8000128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8000088(%rbp)
	movl	$0, -8000100(%rbp)
	jmp	.L2
.L3:
	leaq	-8000016(%rbp), %rax
	movl	-8000100(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8000088(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, -8000100(%rbp)
.L2:
	cmpl	$99999, -8000100(%rbp)
	jle	.L3
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -8000080(%rbp)
	movaps	%xmm0, -8000064(%rbp)
	movaps	%xmm0, -8000048(%rbp)
	movaps	%xmm0, -8000032(%rbp)
	movl	$0, -8000096(%rbp)
	movl	$0, -8000092(%rbp)
	jmp	.L4
.L21:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1750, %rax
	jle	.L5
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1889, %rax
	jg	.L5
	addl	$1, -8000096(%rbp)
	jmp	.L6
.L5:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L6:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$1, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1660, %rax
	jle	.L7
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$1, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1749, %rax
	jg	.L7
	addl	$1, -8000096(%rbp)
	jmp	.L8
.L7:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$1, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L8:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$2, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$2000, %rax
	jle	.L9
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$2, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$2149, %rax
	jg	.L9
	addl	$1, -8000096(%rbp)
	jmp	.L10
.L9:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$2, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L10:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$3, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1549, %rax
	jg	.L11
	addl	$1, -8000096(%rbp)
	jmp	.L12
.L11:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$3, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L12:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$4, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$2280, %rax
	jle	.L13
	addl	$1, -8000096(%rbp)
	jmp	.L14
.L13:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$4, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L14:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$5, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1550, %rax
	jle	.L15
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$5, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1659, %rax
	jg	.L15
	addl	$1, -8000096(%rbp)
	jmp	.L16
.L15:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$5, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$6, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$2150, %rax
	jle	.L17
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$6, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$2279, %rax
	jg	.L17
	addl	$1, -8000096(%rbp)
	jmp	.L18
.L17:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$6, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L18:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$7, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1890, %rax
	jle	.L19
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$7, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	cmpq	$1999, %rax
	jg	.L19
	addl	$1, -8000096(%rbp)
	jmp	.L20
.L19:
	movl	-8000092(%rbp), %eax
	sall	$3, %eax
	addl	$7, %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L20:
	addl	$1, -8000092(%rbp)
.L4:
	cmpl	$12499, -8000092(%rbp)
	jle	.L21
	movl	-8000096(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
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
