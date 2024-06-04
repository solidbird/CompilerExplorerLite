	.file	"square.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	square
	.type	square, @function
square:
.LFB0:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], edi	# num, num
# example/square.c:2: 	return num * num;
	mov	eax, DWORD PTR -4[rbp]	# tmp84, num
	imul	eax, eax	# _2, tmp84
# example/square.c:3: }
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	square, .-square
	.globl	test
	.type	test, @function
test:
.LFB1:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	DWORD PTR -20[rbp], edi	# a, a
	mov	DWORD PTR -24[rbp], esi	# b, b
	mov	DWORD PTR -28[rbp], edx	# c, c
# example/square.c:6: 	int tmp1 = a;
	mov	eax, DWORD PTR -20[rbp]	# tmp82, a
	mov	DWORD PTR -8[rbp], eax	# tmp1, tmp82
# example/square.c:7: 	int tmp2 = c;
	mov	eax, DWORD PTR -28[rbp]	# tmp83, c
	mov	DWORD PTR -4[rbp], eax	# tmp2, tmp83
# example/square.c:8: 	a = c;
	mov	eax, DWORD PTR -28[rbp]	# tmp84, c
	mov	DWORD PTR -20[rbp], eax	# a, tmp84
# example/square.c:9: 	c = tmp1;
	mov	eax, DWORD PTR -8[rbp]	# tmp85, tmp1
	mov	DWORD PTR -28[rbp], eax	# c, tmp85
# example/square.c:10: 	b = b * b;
	mov	eax, DWORD PTR -24[rbp]	# tmp87, b
	imul	eax, eax	# tmp86, tmp87
	mov	DWORD PTR -24[rbp], eax	# b, tmp86
# example/square.c:11: 	while(b == 2){
	jmp	.L4	#
.L5:
# example/square.c:12: 		square(b);
	mov	eax, DWORD PTR -24[rbp]	# tmp88, b
	mov	edi, eax	#, tmp88
	call	square	#
.L4:
# example/square.c:11: 	while(b == 2){
	cmp	DWORD PTR -24[rbp], 2	# b,
	je	.L5	#,
# example/square.c:14: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	test, .-test
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# example/square.c:17: 	return 0;
	mov	eax, 0	# _1,
# example/square.c:18: }
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
