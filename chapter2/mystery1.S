	.file	"mystery1.cc"
	.text
	.section	.text._Z9GetCyclesv,"axG",@progbits,_Z9GetCyclesv,comdat
	.weak	_Z9GetCyclesv
	.type	_Z9GetCyclesv, @function
_Z9GetCyclesv:
.LFB4271:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4271:
	.size	_Z9GetCyclesv, .-_Z9GetCyclesv
	.section	.rodata
	.align 4
	.type	_ZL13manual_unroll, @object
	.size	_ZL13manual_unroll, 4
_ZL13manual_unroll:
	.long	8
	.align 8
	.type	_ZL11kIterations, @object
	.size	_ZL11kIterations, 8
_ZL11kIterations:
	.quad	1000000000
	.align 8
.LC3:
	.string	"%lu iterations, %lu cycles, %4.2f cycles/iteration, %4.2f cycles/inst\n"
.LC4:
	.string	"%lu %lu %lu %lu %lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4274:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movl	$0, %r12d
	movl	$0, %r14d
	movl	$0, %r15d
	movl	$0, %r13d
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	andl	$15, %eax
	movq	%rax, %rbx
	call	_Z9GetCyclesv
	movq	%rax, -72(%rbp)
	movl	$0, %eax
.L6:
	cmpq	$999999999, %rax
	ja	.L5
	addq	%rbx, %r12
	addq	%rbx, %r14
	addq	%rbx, %r15
	addq	%rbx, %r13
	addq	%rbx, %r12
	addq	%rbx, %r14
	addq	%rbx, %r15
	addq	%rbx, %r13
	addq	$1, %rax
	jmp	.L6
.L5:
	call	_Z9GetCyclesv
	subq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	cvtsi2sdq	-64(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	movapd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	movsd	-56(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	stdout(%rip), %rax
	movq	-64(%rbp), %rdx
	movapd	%xmm2, %xmm1
	movq	%rdx, %rcx
	movl	$1000000000, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$2, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	-80(%rbp), %rdx
	subq	$8, %rsp
	pushq	%r13
	movq	%r15, %r9
	movq	%r14, %r8
	movq	%r12, %rcx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	movl	$0, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4274:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.align 8
.LC1:
	.long	0
	.long	1075970048
	.align 8
.LC2:
	.long	0
	.long	1074790400
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
