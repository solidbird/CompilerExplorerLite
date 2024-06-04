	.file	"test.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
	mov	DWORD PTR -4[rbp], edi	# a, a
	mov	DWORD PTR -8[rbp], esi	# b, b
# test.c:2: 	if(a < b){
	mov	eax, DWORD PTR -4[rbp]	# tmp85, a
	cmp	eax, DWORD PTR -8[rbp]	# tmp85, b
	jge	.L2	#,
# test.c:3: 		test(a, b-1);
	mov	eax, DWORD PTR -8[rbp]	# tmp86, b
	lea	edx, -1[rax]	# _1,
	mov	eax, DWORD PTR -4[rbp]	# tmp87, a
	mov	esi, edx	#, _1
	mov	edi, eax	#, tmp87
	call	test	#
# test.c:7: 	return b;
	mov	eax, DWORD PTR -8[rbp]	# _2, b
	jmp	.L4	#
.L2:
# test.c:5: 		return a;
	mov	eax, DWORD PTR -4[rbp]	# _2, a
.L4:
# test.c:8: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	test, .-test
	.globl	square
	.type	square, @function
square:
.LFB1:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], edi	# sq, sq
# test.c:12: 	return sq * sq;
	mov	eax, DWORD PTR -4[rbp]	# tmp84, sq
	imul	eax, eax	# _2, tmp84
# test.c:13: }
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	square, .-square
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
# test.c:17: 	while(test(4, 6)){
	jmp	.L8	#
.L9:
# test.c:18: 		square(5);
	mov	edi, 5	#,
	call	square	#
.L8:
# test.c:17: 	while(test(4, 6)){
	mov	esi, 6	#,
	mov	edi, 4	#,
	call	test	#
	test	eax, eax	# _1
	jne	.L9	#,
# test.c:21: 	return 0;
	mov	eax, 0	# _5,
# test.c:22: }
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
