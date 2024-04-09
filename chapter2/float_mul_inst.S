	.file	"float_mul_inst.cc"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%4.2f %4.2f %4.2f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"%d iterations, %lu cycles, %4.2f cycles/iteration, %4.2f cycles/inst\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5566:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	xorl	%edi, %edi
	call	time@PLT
	call	rand@PLT
	pxor	%xmm5, %xmm5
	xorl	%edi, %edi
	cvtsi2ssl	%eax, %xmm5
	mulss	.LC0(%rip), %xmm5
	movss	%xmm5, 20(%rsp)
	call	time@PLT
	call	rand@PLT
	pxor	%xmm4, %xmm4
	xorl	%edi, %edi
	cvtsi2ssl	%eax, %xmm4
	mulss	.LC0(%rip), %xmm4
	movss	%xmm4, 8(%rsp)
	call	time@PLT
	call	rand@PLT
	pxor	%xmm3, %xmm3
	pxor	%xmm6, %xmm6
	movss	8(%rsp), %xmm4
	cvtsi2ssl	%eax, %xmm3
	mulss	.LC0(%rip), %xmm3
	movss	20(%rsp), %xmm5
	leaq	.LC3(%rip), %rdx
	mulss	.LC1(%rip), %xmm3
	movq	stderr(%rip), %rdi
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	addss	.LC2(%rip), %xmm3
	movl	$1, %esi
	movl	$3, %eax
	movss	%xmm4, 24(%rsp)
	cvtss2sd	%xmm4, %xmm2
	cvtss2sd	%xmm5, %xmm1
	cvtss2sd	%xmm3, %xmm6
	movapd	%xmm6, %xmm0
	movss	%xmm3, 28(%rsp)
	movsd	%xmm6, 8(%rsp)
	call	__fprintf_chk@PLT
	rdtsc
	movss	28(%rsp), %xmm3
	movss	24(%rsp), %xmm4
	movss	20(%rsp), %xmm5
	movsd	8(%rsp), %xmm6
	movq	%rax, %rcx
	salq	$32, %rdx
	movl	$10000, %eax
	orq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	mulss	%xmm3, %xmm5
	mulss	%xmm3, %xmm4
	mulss	%xmm3, %xmm5
	mulss	%xmm3, %xmm4
	mulss	%xmm3, %xmm5
	mulss	%xmm3, %xmm4
	mulss	%xmm3, %xmm5
	mulss	%xmm3, %xmm4
	subl	$1, %eax
	jne	.L2
	movss	%xmm4, 24(%rsp)
	movss	%xmm5, 20(%rsp)
	movsd	%xmm6, 8(%rsp)
	rdtsc
	movsd	.LC5(%rip), %xmm1
	pxor	%xmm0, %xmm0
	movl	$1, %esi
	movq	stdout(%rip), %rdi
	salq	$32, %rdx
	orq	%rdx, %rax
	leaq	.LC6(%rip), %rdx
	subq	%rcx, %rax
	movl	$10000, %ecx
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC4(%rip), %xmm0
	movq	%rax, %r8
	movl	$2, %eax
	mulsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm1
	call	__fprintf_chk@PLT
	movsd	8(%rsp), %xmm6
	pxor	%xmm2, %xmm2
	movss	24(%rsp), %xmm4
	movss	20(%rsp), %xmm5
	pxor	%xmm1, %xmm1
	movq	stderr(%rip), %rdi
	leaq	.LC3(%rip), %rdx
	movapd	%xmm6, %xmm0
	movl	$1, %esi
	movl	$3, %eax
	cvtss2sd	%xmm4, %xmm2
	cvtss2sd	%xmm5, %xmm1
	call	__fprintf_chk@PLT
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5566:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	805306368
	.align 4
.LC1:
	.long	981668463
	.align 4
.LC2:
	.long	1065353216
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1086556160
	.align 8
.LC5:
	.long	0
	.long	1069547520
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
