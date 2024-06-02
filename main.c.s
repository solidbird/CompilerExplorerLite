	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	last_position
	.bss
	.align 8
	.type	last_position, @object
	.size	last_position, 8
last_position:
	.zero	8
	.text
	.globl	copyString
	.type	copyString, @function
copyString:
.LFB6:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# s, s
# main.c:19: 	s2 = (char*) malloc(strlen(s)+1);
	mov	rax, QWORD PTR -24[rbp]	# tmp86, s
	mov	rdi, rax	#, tmp86
	call	strlen@PLT	#
# main.c:19: 	s2 = (char*) malloc(strlen(s)+1);
	add	rax, 1	# _2,
	mov	rdi, rax	#, _2
	call	malloc@PLT	#
	mov	QWORD PTR -8[rbp], rax	# s2, tmp87
# main.c:20: 	strcpy(s2, s);
	mov	rdx, QWORD PTR -24[rbp]	# tmp88, s
	mov	rax, QWORD PTR -8[rbp]	# tmp89, s2
	mov	rsi, rdx	#, tmp88
	mov	rdi, rax	#, tmp89
	call	strcpy@PLT	#
# main.c:21: 	return (char*)s2;
	mov	rax, QWORD PTR -8[rbp]	# _8, s2
# main.c:22: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	copyString, .-copyString
	.globl	remove_spaces
	.type	remove_spaces, @function
remove_spaces:
.LFB7:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# s, s
# main.c:25: 	char* d = s;
	mov	rax, QWORD PTR -40[rbp]	# tmp93, s
	mov	QWORD PTR -16[rbp], rax	# d, tmp93
# main.c:26: 	char* tmp = (char*) malloc(strlen(d)+1);
	mov	rax, QWORD PTR -16[rbp]	# tmp94, d
	mov	rdi, rax	#, tmp94
	call	strlen@PLT	#
# main.c:26: 	char* tmp = (char*) malloc(strlen(d)+1);
	add	rax, 1	# _2,
	mov	rdi, rax	#, _2
	call	malloc@PLT	#
	mov	QWORD PTR -8[rbp], rax	# tmp, tmp95
# main.c:27: 	strcpy(tmp, d);
	mov	rdx, QWORD PTR -16[rbp]	# tmp96, d
	mov	rax, QWORD PTR -8[rbp]	# tmp97, tmp
	mov	rsi, rdx	#, tmp96
	mov	rdi, rax	#, tmp97
	call	strcpy@PLT	#
# main.c:28: 	int i = -1;
	mov	DWORD PTR -20[rbp], -1	# i,
# main.c:31: 		while (*d == ' ' || *d == '\t') {
	jmp	.L4	#
.L5:
# main.c:32: 			d++;
	add	QWORD PTR -16[rbp], 1	# d,
.L4:
# main.c:31: 		while (*d == ' ' || *d == '\t') {
	mov	rax, QWORD PTR -16[rbp]	# tmp98, d
	movzx	eax, BYTE PTR [rax]	# _3, *d_11
# main.c:31: 		while (*d == ' ' || *d == '\t') {
	cmp	al, 32	# _3,
	je	.L5	#,
# main.c:31: 		while (*d == ' ' || *d == '\t') {
	mov	rax, QWORD PTR -16[rbp]	# tmp99, d
	movzx	eax, BYTE PTR [rax]	# _4, *d_11
# main.c:31: 		while (*d == ' ' || *d == '\t') {
	cmp	al, 9	# _4,
	je	.L5	#,
# main.c:34: 		i++;
	add	DWORD PTR -20[rbp], 1	# i,
# main.c:35: 	}while(tmp[i] = *d++);
	mov	rdx, QWORD PTR -16[rbp]	# d.0_5, d
	lea	rax, 1[rdx]	# tmp100,
	mov	QWORD PTR -16[rbp], rax	# d, tmp100
# main.c:35: 	}while(tmp[i] = *d++);
	mov	eax, DWORD PTR -20[rbp]	# tmp101, i
	movsx	rcx, eax	# _6, tmp101
	mov	rax, QWORD PTR -8[rbp]	# tmp102, tmp
	add	rax, rcx	# _7, _6
# main.c:35: 	}while(tmp[i] = *d++);
	movzx	edx, BYTE PTR [rdx]	# _8, *d.0_5
# main.c:35: 	}while(tmp[i] = *d++);
	mov	BYTE PTR [rax], dl	# *_7, _8
# main.c:35: 	}while(tmp[i] = *d++);
	movzx	eax, BYTE PTR [rax]	# _9, *_7
# main.c:35: 	}while(tmp[i] = *d++);
	test	al, al	# _9
	jne	.L4	#,
# main.c:36: 	return tmp; 
	mov	rax, QWORD PTR -8[rbp]	# _24, tmp
# main.c:37: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	remove_spaces, .-remove_spaces
	.globl	line_num_of_comment
	.type	line_num_of_comment, @function
line_num_of_comment:
.LFB8:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# comment, comment
# main.c:40: 	char* line_num_str = strstr(comment, ":") + 1;
	mov	rax, QWORD PTR -24[rbp]	# tmp85, comment
	mov	esi, 58	#,
	mov	rdi, rax	#, tmp85
	call	strchr@PLT	#
# main.c:40: 	char* line_num_str = strstr(comment, ":") + 1;
	add	rax, 1	# tmp86,
	mov	QWORD PTR -8[rbp], rax	# line_num_str, tmp86
# main.c:41: 	return atoi(line_num_str);
	mov	rax, QWORD PTR -8[rbp]	# tmp87, line_num_str
	mov	rdi, rax	#, tmp87
	call	atoi@PLT	#
# main.c:42: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	line_num_of_comment, .-line_num_of_comment
	.section	.rodata
.LC0:
	.string	""
.LC1:
	.string	"# %s:"
.LC2:
	.string	"@function"
	.text
	.globl	block_until_next
	.type	block_until_next, @function
block_until_next:
.LFB9:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 80	#,
	mov	QWORD PTR -56[rbp], rdi	# fp, fp
	mov	QWORD PTR -64[rbp], rsi	# block, block
	mov	QWORD PTR -72[rbp], rdx	# last_pos, last_pos
	mov	QWORD PTR -80[rbp], rcx	# src_filename, src_filename
# main.c:44: void block_until_next(FILE *fp, char* block, long last_pos, char* src_filename){
	mov	rax, QWORD PTR fs:40	# tmp102, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.5692, tmp102
	xor	eax, eax	# tmp102
# main.c:45: 	char *asm_line = NULL;
	mov	QWORD PTR -40[rbp], 0	# asm_line,
# main.c:46: 	size_t asm_len = 0;
	mov	QWORD PTR -32[rbp], 0	# asm_len,
# main.c:49: 	fseek(fp, last_pos, SEEK_SET);
	mov	rcx, QWORD PTR -72[rbp]	# tmp88, last_pos
	mov	rax, QWORD PTR -56[rbp]	# tmp89, fp
	mov	edx, 0	#,
	mov	rsi, rcx	#, tmp88
	mov	rdi, rax	#, tmp89
	call	fseek@PLT	#
# main.c:51: 	char* commentline = "";
	lea	rax, .LC0[rip]	# tmp90,
	mov	QWORD PTR -24[rbp], rax	# commentline, tmp90
# main.c:52: 	asprintf(&commentline, "# %s:", src_filename);
	mov	rdx, QWORD PTR -80[rbp]	# tmp91, src_filename
	lea	rax, -24[rbp]	# tmp92,
	lea	rcx, .LC1[rip]	# tmp93,
	mov	rsi, rcx	#, tmp93
	mov	rdi, rax	#, tmp92
	mov	eax, 0	#,
	call	asprintf@PLT	#
# main.c:54: 	while ((asm_read = getline(&asm_line, &asm_len, fp)) != -1) {
	jmp	.L11	#
.L13:
# main.c:55: 		if(strstr(asm_line, "@function") != NULL || strstr(asm_line, commentline) != NULL){
	mov	rax, QWORD PTR -40[rbp]	# asm_line.1_1, asm_line
	lea	rdx, .LC2[rip]	# tmp94,
	mov	rsi, rdx	#, tmp94
	mov	rdi, rax	#, asm_line.1_1
	call	strstr@PLT	#
# main.c:55: 		if(strstr(asm_line, "@function") != NULL || strstr(asm_line, commentline) != NULL){
	test	rax, rax	# _2
	jne	.L12	#,
# main.c:55: 		if(strstr(asm_line, "@function") != NULL || strstr(asm_line, commentline) != NULL){
	mov	rdx, QWORD PTR -24[rbp]	# commentline.2_3, commentline
	mov	rax, QWORD PTR -40[rbp]	# asm_line.3_4, asm_line
	mov	rsi, rdx	#, commentline.2_3
	mov	rdi, rax	#, asm_line.3_4
	call	strstr@PLT	#
# main.c:55: 		if(strstr(asm_line, "@function") != NULL || strstr(asm_line, commentline) != NULL){
	test	rax, rax	# _5
	jne	.L12	#,
# main.c:59: 		strcat(block, asm_line);
	mov	rdx, QWORD PTR -40[rbp]	# asm_line.4_6, asm_line
	mov	rax, QWORD PTR -64[rbp]	# tmp95, block
	mov	rsi, rdx	#, asm_line.4_6
	mov	rdi, rax	#, tmp95
	call	strcat@PLT	#
.L11:
# main.c:54: 	while ((asm_read = getline(&asm_line, &asm_len, fp)) != -1) {
	mov	rdx, QWORD PTR -56[rbp]	# tmp96, fp
	lea	rcx, -32[rbp]	# tmp97,
	lea	rax, -40[rbp]	# tmp98,
	mov	rsi, rcx	#, tmp97
	mov	rdi, rax	#, tmp98
	call	getline@PLT	#
	mov	QWORD PTR -16[rbp], rax	# asm_read, tmp99
# main.c:54: 	while ((asm_read = getline(&asm_line, &asm_len, fp)) != -1) {
	cmp	QWORD PTR -16[rbp], -1	# asm_read,
	jne	.L13	#,
.L12:
# main.c:62: 	fseek(fp, last_pos, SEEK_SET);
	mov	rcx, QWORD PTR -72[rbp]	# tmp100, last_pos
	mov	rax, QWORD PTR -56[rbp]	# tmp101, fp
	mov	edx, 0	#,
	mov	rsi, rcx	#, tmp100
	mov	rdi, rax	#, tmp101
	call	fseek@PLT	#
# main.c:63: }
	nop	
	mov	rax, QWORD PTR -8[rbp]	# tmp103, D.5692
	sub	rax, QWORD PTR fs:40	# tmp103, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L14	#,
	call	__stack_chk_fail@PLT	#
.L14:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	block_until_next, .-block_until_next
	.section	.rodata
.LC3:
	.string	"r"
	.text
	.globl	scan_asm_blocks
	.type	scan_asm_blocks, @function
scan_asm_blocks:
.LFB10:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 1152	#,
	mov	QWORD PTR -1128[rbp], rdi	# src_file, src_file
	mov	QWORD PTR -1136[rbp], rsi	# asm_file, asm_file
	mov	QWORD PTR -1144[rbp], rdx	# root, root
# main.c:65: void scan_asm_blocks(char* src_file, char* asm_file, MapSrc *root){
	mov	rax, QWORD PTR fs:40	# tmp132, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.5697, tmp132
	xor	eax, eax	# tmp132
# main.c:66: 	FILE *asm_fp = fopen(asm_file, "r");
	mov	rax, QWORD PTR -1136[rbp]	# tmp95, asm_file
	lea	rdx, .LC3[rip]	# tmp96,
	mov	rsi, rdx	#, tmp96
	mov	rdi, rax	#, tmp95
	call	fopen@PLT	#
	mov	QWORD PTR -1072[rbp], rax	# asm_fp, tmp97
# main.c:67: 	char *asm_line = NULL;
	mov	QWORD PTR -1104[rbp], 0	# asm_line,
# main.c:68: 	size_t asm_len = 0;
	mov	QWORD PTR -1096[rbp], 0	# asm_len,
# main.c:71: 	int i = 1;
	mov	DWORD PTR -1112[rbp], 1	# i,
# main.c:75: 	MapSrc *node = root;
	mov	rax, QWORD PTR -1144[rbp]	# tmp98, root
	mov	QWORD PTR -1080[rbp], rax	# node, tmp98
# main.c:77: 	char* commentline = "";
	lea	rax, .LC0[rip]	# tmp99,
	mov	QWORD PTR -1088[rbp], rax	# commentline, tmp99
# main.c:78: 	asprintf(&commentline, "# %s:", src_file);
	mov	rdx, QWORD PTR -1128[rbp]	# tmp100, src_file
	lea	rax, -1088[rbp]	# tmp101,
	lea	rcx, .LC1[rip]	# tmp102,
	mov	rsi, rcx	#, tmp102
	mov	rdi, rax	#, tmp101
	mov	eax, 0	#,
	call	asprintf@PLT	#
# main.c:80: 	while ((asm_read = getline(&asm_line, &asm_len, asm_fp)) != -1) {
	jmp	.L16	#
.L21:
# main.c:81: 		long last_pos = ftell(asm_fp);
	mov	rax, QWORD PTR -1072[rbp]	# tmp103, asm_fp
	mov	rdi, rax	#, tmp103
	call	ftell@PLT	#
	mov	QWORD PTR -1056[rbp], rax	# last_pos, tmp104
# main.c:83: 		if(strstr(asm_line, "@function") != NULL){
	mov	rax, QWORD PTR -1104[rbp]	# asm_line.5_1, asm_line
	lea	rdx, .LC2[rip]	# tmp105,
	mov	rsi, rdx	#, tmp105
	mov	rdi, rax	#, asm_line.5_1
	call	strstr@PLT	#
# main.c:83: 		if(strstr(asm_line, "@function") != NULL){
	test	rax, rax	# _2
	je	.L17	#,
# main.c:84: 		 	block_until_next(asm_fp, node->asm_block, last_pos, src_file);
	mov	rax, QWORD PTR -1080[rbp]	# tmp106, node
	lea	rsi, 40[rax]	# _3,
# main.c:84: 		 	block_until_next(asm_fp, node->asm_block, last_pos, src_file);
	mov	rcx, QWORD PTR -1128[rbp]	# tmp107, src_file
	mov	rdx, QWORD PTR -1056[rbp]	# tmp108, last_pos
	mov	rax, QWORD PTR -1072[rbp]	# tmp109, asm_fp
	mov	rdi, rax	#, tmp109
	call	block_until_next	#
# main.c:85: 			node = node->child;
	mov	rax, QWORD PTR -1080[rbp]	# tmp110, node
	mov	rax, QWORD PTR 8[rax]	# tmp111, node_17->child
	mov	QWORD PTR -1080[rbp], rax	# node, tmp111
# main.c:86: 			done_block[0] = '\0';
	mov	rax, QWORD PTR -1048[rbp]	# tmp112, done_block
	mov	BYTE PTR [rax], 0	# *done_block_42(D),
.L17:
# main.c:89: 		if(strstr(asm_line, commentline)){
	mov	rdx, QWORD PTR -1088[rbp]	# commentline.6_4, commentline
	mov	rax, QWORD PTR -1104[rbp]	# asm_line.7_5, asm_line
	mov	rsi, rdx	#, commentline.6_4
	mov	rdi, rax	#, asm_line.7_5
	call	strstr@PLT	#
# main.c:89: 		if(strstr(asm_line, commentline)){
	test	rax, rax	# _6
	je	.L16	#,
# main.c:90: 			int line_num = atoi(strstr(asm_line, ":") + 1);
	mov	rax, QWORD PTR -1104[rbp]	# asm_line.8_7, asm_line
	mov	esi, 58	#,
	mov	rdi, rax	#, asm_line.8_7
	call	strchr@PLT	#
# main.c:90: 			int line_num = atoi(strstr(asm_line, ":") + 1);
	add	rax, 1	# _9,
# main.c:90: 			int line_num = atoi(strstr(asm_line, ":") + 1);
	mov	rdi, rax	#, _9
	call	atoi@PLT	#
	mov	DWORD PTR -1108[rbp], eax	# line_num, tmp113
# main.c:92: 			while(node->line_count != line_num){
	jmp	.L18	#
.L20:
# main.c:93: 				if(node->line_count > line_num){
	mov	rax, QWORD PTR -1080[rbp]	# tmp114, node
	mov	eax, DWORD PTR 32[rax]	# _10, node_16->line_count
# main.c:93: 				if(node->line_count > line_num){
	cmp	DWORD PTR -1108[rbp], eax	# line_num, _10
	jge	.L19	#,
# main.c:94: 					node = node->parent;
	mov	rax, QWORD PTR -1080[rbp]	# tmp115, node
	mov	rax, QWORD PTR [rax]	# tmp116, node_16->parent
	mov	QWORD PTR -1080[rbp], rax	# node, tmp116
.L19:
# main.c:96: 				if(node->line_count < line_num){
	mov	rax, QWORD PTR -1080[rbp]	# tmp117, node
	mov	eax, DWORD PTR 32[rax]	# _11, node_15->line_count
# main.c:96: 				if(node->line_count < line_num){
	cmp	DWORD PTR -1108[rbp], eax	# line_num, _11
	jle	.L18	#,
# main.c:97: 					node = node->child;
	mov	rax, QWORD PTR -1080[rbp]	# tmp118, node
	mov	rax, QWORD PTR 8[rax]	# tmp119, node_15->child
	mov	QWORD PTR -1080[rbp], rax	# node, tmp119
.L18:
# main.c:92: 			while(node->line_count != line_num){
	mov	rax, QWORD PTR -1080[rbp]	# tmp120, node
	mov	eax, DWORD PTR 32[rax]	# _12, node_16->line_count
# main.c:92: 			while(node->line_count != line_num){
	cmp	DWORD PTR -1108[rbp], eax	# line_num, _12
	jne	.L20	#,
# main.c:100: 			block_until_next(asm_fp, node->asm_block, last_pos, src_file);
	mov	rax, QWORD PTR -1080[rbp]	# tmp121, node
	lea	rsi, 40[rax]	# _13,
# main.c:100: 			block_until_next(asm_fp, node->asm_block, last_pos, src_file);
	mov	rcx, QWORD PTR -1128[rbp]	# tmp122, src_file
	mov	rdx, QWORD PTR -1056[rbp]	# tmp123, last_pos
	mov	rax, QWORD PTR -1072[rbp]	# tmp124, asm_fp
	mov	rdi, rax	#, tmp124
	call	block_until_next	#
# main.c:101: 			done_block[0] = '\0';
	mov	rax, QWORD PTR -1048[rbp]	# tmp125, done_block
	mov	BYTE PTR [rax], 0	# *done_block_42(D),
# main.c:102: 			node = node->child;
	mov	rax, QWORD PTR -1080[rbp]	# tmp126, node
	mov	rax, QWORD PTR 8[rax]	# tmp127, node_16->child
	mov	QWORD PTR -1080[rbp], rax	# node, tmp127
.L16:
# main.c:80: 	while ((asm_read = getline(&asm_line, &asm_len, asm_fp)) != -1) {
	mov	rdx, QWORD PTR -1072[rbp]	# tmp128, asm_fp
	lea	rcx, -1096[rbp]	# tmp129,
	lea	rax, -1104[rbp]	# tmp130,
	mov	rsi, rcx	#, tmp129
	mov	rdi, rax	#, tmp130
	call	getline@PLT	#
	mov	QWORD PTR -1064[rbp], rax	# asm_read, tmp131
# main.c:80: 	while ((asm_read = getline(&asm_line, &asm_len, asm_fp)) != -1) {
	cmp	QWORD PTR -1064[rbp], -1	# asm_read,
	jne	.L21	#,
# main.c:105: }
	nop	
	mov	rax, QWORD PTR -8[rbp]	# tmp133, D.5697
	sub	rax, QWORD PTR fs:40	# tmp133, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L22	#,
	call	__stack_chk_fail@PLT	#
.L22:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	scan_asm_blocks, .-scan_asm_blocks
	.globl	prepare_src_list
	.type	prepare_src_list, @function
prepare_src_list:
.LFB11:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r12	#
	push	rbx	#
	sub	rsp, 2176	#,
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	mov	QWORD PTR -2184[rbp], rdi	# src_file, src_file
# main.c:107: MapSrc* prepare_src_list(char* src_file){
	mov	rax, QWORD PTR fs:40	# tmp182, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -24[rbp], rax	# D.5699, tmp182
	xor	eax, eax	# tmp182
# main.c:109: 	char *src_line = NULL;
	mov	QWORD PTR -2168[rbp], 0	# src_line,
# main.c:110: 	size_t src_len = 0;
	mov	QWORD PTR -2160[rbp], 0	# src_len,
# main.c:113: 	src_fp = fopen(src_file, "r");
	mov	rax, QWORD PTR -2184[rbp]	# tmp106, src_file
	lea	rdx, .LC3[rip]	# tmp107,
	mov	rsi, rdx	#, tmp107
	mov	rdi, rax	#, tmp106
	call	fopen@PLT	#
	mov	QWORD PTR -2152[rbp], rax	# src_fp, tmp108
# main.c:115: 	MapSrc* src_line_mapping = (MapSrc*) malloc(sizeof(MapSrc));
	mov	edi, 2088	#,
	call	malloc@PLT	#
	mov	QWORD PTR -2144[rbp], rax	# src_line_mapping, tmp109
# main.c:116: 	src_read = getline(&src_line, &src_len, src_fp);
	mov	rdx, QWORD PTR -2152[rbp]	# tmp110, src_fp
	lea	rcx, -2160[rbp]	# tmp111,
	lea	rax, -2168[rbp]	# tmp112,
	mov	rsi, rcx	#, tmp111
	mov	rdi, rax	#, tmp112
	call	getline@PLT	#
	mov	QWORD PTR -2136[rbp], rax	# src_read, tmp113
# main.c:118: 	char *tmp_line = copyString(src_line);
	mov	rax, QWORD PTR -2168[rbp]	# src_line.9_1, src_line
	mov	rdi, rax	#, src_line.9_1
	call	copyString	#
	mov	QWORD PTR -2128[rbp], rax	# tmp_line, tmp114
# main.c:126: 		.color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255},
	call	rand@PLT	#
# main.c:126: 		.color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255},
	cdq
	shr	edx, 24	# tmp116,
	add	eax, edx	# tmp117, tmp116
	movzx	eax, al	# tmp118, tmp117
	sub	eax, edx	# tmp119, tmp116
# main.c:120: 	*src_line_mapping = (MapSrc){
	mov	r12d, eax	# _4, _3
# main.c:126: 		.color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255},
	call	rand@PLT	#
# main.c:126: 		.color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255},
	cdq
	shr	edx, 24	# tmp121,
	add	eax, edx	# tmp122, tmp121
	movzx	eax, al	# tmp123, tmp122
	sub	eax, edx	# tmp124, tmp121
# main.c:120: 	*src_line_mapping = (MapSrc){
	mov	ebx, eax	# _7, _6
# main.c:126: 		.color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255},
	call	rand@PLT	#
# main.c:126: 		.color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255},
	cdq
	shr	edx, 24	# tmp126,
	add	eax, edx	# tmp127, tmp126
	movzx	eax, al	# tmp128, tmp127
	sub	eax, edx	# tmp129, tmp126
# main.c:120: 	*src_line_mapping = (MapSrc){
	mov	ecx, eax	# _10, _9
	mov	rax, QWORD PTR -2144[rbp]	# tmp130, src_line_mapping
	mov	QWORD PTR [rax], 0	# src_line_mapping_29->parent,
	mov	rax, QWORD PTR -2144[rbp]	# tmp131, src_line_mapping
	mov	QWORD PTR 8[rax], 0	# src_line_mapping_29->child,
	mov	rax, QWORD PTR -2144[rbp]	# tmp132, src_line_mapping
	mov	rdx, QWORD PTR -2184[rbp]	# tmp133, src_file
	mov	QWORD PTR 16[rax], rdx	# src_line_mapping_29->filename, tmp133
	mov	rax, QWORD PTR -2144[rbp]	# tmp134, src_line_mapping
	mov	rdx, QWORD PTR -2128[rbp]	# tmp135, tmp_line
	mov	QWORD PTR 24[rax], rdx	# src_line_mapping_29->src_line, tmp135
	mov	rax, QWORD PTR -2144[rbp]	# tmp136, src_line_mapping
	mov	DWORD PTR 32[rax], 1	# src_line_mapping_29->line_count,
	mov	rax, QWORD PTR -2144[rbp]	# tmp137, src_line_mapping
	mov	BYTE PTR 36[rax], r12b	# src_line_mapping_29->color.r, _4
	mov	rax, QWORD PTR -2144[rbp]	# tmp138, src_line_mapping
	mov	BYTE PTR 37[rax], bl	# src_line_mapping_29->color.g, _7
	mov	rax, QWORD PTR -2144[rbp]	# tmp139, src_line_mapping
	mov	BYTE PTR 38[rax], cl	# src_line_mapping_29->color.b, _10
	mov	rax, QWORD PTR -2144[rbp]	# tmp140, src_line_mapping
	mov	BYTE PTR 39[rax], -1	# src_line_mapping_29->color.a,
	mov	rax, QWORD PTR -2144[rbp]	# tmp141, src_line_mapping
	mov	QWORD PTR 40[rax], 0	# src_line_mapping_29->asm_block,
	mov	QWORD PTR 48[rax], 0	# src_line_mapping_29->asm_block,
	lea	rdx, 56[rax]	# tmp142,
	mov	eax, 0	# tmp143,
	mov	ecx, 254	# tmp144,
	mov	rdi, rdx	# tmp142, tmp142
	rep stosq
# main.c:130: 	while ((src_read = getline(&src_line, &src_len, src_fp)) != -1) {
	jmp	.L24	#
.L25:
# main.c:131: 		MapSrc* src_node = (MapSrc*) malloc(sizeof(MapSrc));
	mov	edi, 2088	#,
	call	malloc@PLT	#
	mov	QWORD PTR -2120[rbp], rax	# src_node, tmp145
# main.c:132: 		tmp_line = copyString(src_line);
	mov	rax, QWORD PTR -2168[rbp]	# src_line.10_11, src_line
	mov	rdi, rax	#, src_line.10_11
	call	copyString	#
	mov	QWORD PTR -2128[rbp], rax	# tmp_line, tmp146
# main.c:134: 		src_node->parent = NULL;
	mov	rax, QWORD PTR -2120[rbp]	# tmp147, src_node
	mov	QWORD PTR [rax], 0	# src_node_56->parent,
# main.c:135: 		src_node->child = NULL;
	mov	rax, QWORD PTR -2120[rbp]	# tmp148, src_node
	mov	QWORD PTR 8[rax], 0	# src_node_56->child,
# main.c:136: 		src_node->filename = src_file;
	mov	rax, QWORD PTR -2120[rbp]	# tmp149, src_node
	mov	rdx, QWORD PTR -2184[rbp]	# tmp150, src_file
	mov	QWORD PTR 16[rax], rdx	# src_node_56->filename, tmp150
# main.c:137: 		src_node->src_line = tmp_line;
	mov	rax, QWORD PTR -2120[rbp]	# tmp151, src_node
	mov	rdx, QWORD PTR -2128[rbp]	# tmp152, tmp_line
	mov	QWORD PTR 24[rax], rdx	# src_node_56->src_line, tmp152
# main.c:138: 		src_node->line_count = NULL;
	mov	rax, QWORD PTR -2120[rbp]	# tmp153, src_node
	mov	DWORD PTR 32[rax], 0	# src_node_56->line_count,
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	call	rand@PLT	#
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	cdq
	shr	edx, 24	# tmp155,
	add	eax, edx	# tmp156, tmp155
	movzx	eax, al	# tmp157, tmp156
	sub	eax, edx	# tmp158, tmp155
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	mov	r12d, eax	# _14, _13
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	call	rand@PLT	#
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	cdq
	shr	edx, 24	# tmp160,
	add	eax, edx	# tmp161, tmp160
	movzx	eax, al	# tmp162, tmp161
	sub	eax, edx	# tmp163, tmp160
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	mov	ebx, eax	# _17, _16
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	call	rand@PLT	#
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	cdq
	shr	edx, 24	# tmp165,
	add	eax, edx	# tmp166, tmp165
	movzx	eax, al	# tmp167, tmp166
	sub	eax, edx	# tmp168, tmp165
# main.c:139: 		src_node->color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255};
	mov	edx, eax	# _20, _19
	mov	rax, QWORD PTR -2120[rbp]	# tmp169, src_node
	mov	BYTE PTR 36[rax], r12b	# src_node_56->color.r, _14
	mov	rax, QWORD PTR -2120[rbp]	# tmp170, src_node
	mov	BYTE PTR 37[rax], bl	# src_node_56->color.g, _17
	mov	rax, QWORD PTR -2120[rbp]	# tmp171, src_node
	mov	BYTE PTR 38[rax], dl	# src_node_56->color.b, _20
	mov	rax, QWORD PTR -2120[rbp]	# tmp172, src_node
	mov	BYTE PTR 39[rax], -1	# src_node_56->color.a,
# main.c:140: 		src_node->asm_block[0] = '\0';
	mov	rax, QWORD PTR -2120[rbp]	# tmp173, src_node
	mov	BYTE PTR 40[rax], 0	# src_node_56->asm_block[0],
# main.c:142: 		add_node(src_line_mapping, src_node);
	mov	rdx, QWORD PTR -2120[rbp]	# tmp174, src_node
	mov	rax, QWORD PTR -2144[rbp]	# tmp175, src_line_mapping
	mov	rsi, rdx	#, tmp174
	mov	rdi, rax	#, tmp175
	call	add_node@PLT	#
.L24:
# main.c:130: 	while ((src_read = getline(&src_line, &src_len, src_fp)) != -1) {
	mov	rdx, QWORD PTR -2152[rbp]	# tmp176, src_fp
	lea	rcx, -2160[rbp]	# tmp177,
	lea	rax, -2168[rbp]	# tmp178,
	mov	rsi, rcx	#, tmp177
	mov	rdi, rax	#, tmp178
	call	getline@PLT	#
	mov	QWORD PTR -2136[rbp], rax	# src_read, tmp179
# main.c:130: 	while ((src_read = getline(&src_line, &src_len, src_fp)) != -1) {
	cmp	QWORD PTR -2136[rbp], -1	# src_read,
	jne	.L25	#,
# main.c:145: 	fclose(src_fp);
	mov	rax, QWORD PTR -2152[rbp]	# tmp180, src_fp
	mov	rdi, rax	#, tmp180
	call	fclose@PLT	#
# main.c:147: 	return src_line_mapping;
	mov	rax, QWORD PTR -2144[rbp]	# _50, src_line_mapping
# main.c:148: }
	mov	rdx, QWORD PTR -24[rbp]	# tmp183, D.5699
	sub	rdx, QWORD PTR fs:40	# tmp183, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L27	#,
	call	__stack_chk_fail@PLT	#
.L27:
	add	rsp, 2176	#,
	pop	rbx	#
	pop	r12	#
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	prepare_src_list, .-prepare_src_list
	.section	.rodata
.LC4:
	.string	"/bin/gcc"
.LC5:
	.string	"gcc"
.LC6:
	.string	"-S"
.LC7:
	.string	"-Iincludes"
.LC8:
	.string	"-fverbose-asm"
.LC9:
	.string	"-masm=intel"
.LC10:
	.string	"-o"
	.text
	.globl	create_buid_asm
	.type	create_buid_asm, @function
create_buid_asm:
.LFB12:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 336	#,
	mov	QWORD PTR -328[rbp], rdi	# src_file, src_file
# main.c:150: char* create_buid_asm(char* src_file){
	mov	rax, QWORD PTR fs:40	# tmp101, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.5700, tmp101
	xor	eax, eax	# tmp101
# main.c:151: 	const char *cmd_build_asm = "/bin/gcc";
	lea	rax, .LC4[rip]	# tmp84,
	mov	QWORD PTR -312[rbp], rax	# cmd_build_asm, tmp84
# main.c:154: 	strcpy(asm_file, src_file);
	mov	rdx, QWORD PTR -328[rbp]	# tmp85, src_file
	lea	rax, -224[rbp]	# tmp86,
	mov	rsi, rdx	#, tmp85
	mov	rdi, rax	#, tmp86
	call	strcpy@PLT	#
# main.c:155: 	strcpy(file_end, ".s");
	lea	rax, -112[rbp]	# tmp87,
	mov	WORD PTR [rax], 29486	# MEM <char[1:3]> [(void *)&file_end],
	mov	BYTE PTR 2[rax], 0	# MEM <char[1:3]> [(void *)&file_end],
# main.c:156: 	strcat(asm_file, file_end);
	lea	rdx, -112[rbp]	# tmp88,
	lea	rax, -224[rbp]	# tmp89,
	mov	rsi, rdx	#, tmp88
	mov	rdi, rax	#, tmp89
	call	strcat@PLT	#
# main.c:158: 	const char *args[] = {"gcc", "-S", "-Iincludes","-fverbose-asm", "-masm=intel", src_file, "-o", asm_file, NULL};
	lea	rax, .LC5[rip]	# tmp90,
	mov	QWORD PTR -304[rbp], rax	# args[0], tmp90
	lea	rax, .LC6[rip]	# tmp91,
	mov	QWORD PTR -296[rbp], rax	# args[1], tmp91
	lea	rax, .LC7[rip]	# tmp92,
	mov	QWORD PTR -288[rbp], rax	# args[2], tmp92
	lea	rax, .LC8[rip]	# tmp93,
	mov	QWORD PTR -280[rbp], rax	# args[3], tmp93
	lea	rax, .LC9[rip]	# tmp94,
	mov	QWORD PTR -272[rbp], rax	# args[4], tmp94
	mov	rax, QWORD PTR -328[rbp]	# tmp95, src_file
	mov	QWORD PTR -264[rbp], rax	# args[5], tmp95
	lea	rax, .LC10[rip]	# tmp96,
	mov	QWORD PTR -256[rbp], rax	# args[6], tmp96
	lea	rax, -224[rbp]	# tmp97,
	mov	QWORD PTR -248[rbp], rax	# args[7], tmp97
	mov	QWORD PTR -240[rbp], 0	# args[8],
# main.c:159: 	execv(cmd_build_asm, args);
	lea	rdx, -304[rbp]	# tmp98,
	mov	rax, QWORD PTR -312[rbp]	# tmp99, cmd_build_asm
	mov	rsi, rdx	#, tmp98
	mov	rdi, rax	#, tmp99
	call	execv@PLT	#
# main.c:161: 	return asm_file;
	mov	eax, 0	# _17,
# main.c:162: }
	mov	rdx, QWORD PTR -8[rbp]	# tmp102, D.5700
	sub	rdx, QWORD PTR fs:40	# tmp102, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L30	#,
	call	__stack_chk_fail@PLT	#
.L30:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	create_buid_asm, .-create_buid_asm
	.section	.rodata
.LC11:
	.string	"0:"
.LC12:
	.string	"%s\n%d:"
	.text
	.globl	setup_line_numbers
	.type	setup_line_numbers, @function
setup_line_numbers:
.LFB13:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	rbx	#
	sub	rsp, 56	#,
	.cfi_offset 3, -24
	movq	QWORD PTR -56[rbp], xmm0	# pos, pos
# main.c:164: void setup_line_numbers(Vector2 pos){
	mov	rax, QWORD PTR fs:40	# tmp99, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -24[rbp], rax	# D.5708, tmp99
	xor	eax, eax	# tmp99
# main.c:165: 	int text_width_last = 0;
	mov	DWORD PTR -40[rbp], 0	# text_width_last,
# main.c:166:  	int text_width_current = 0;
	mov	DWORD PTR -36[rbp], 0	# text_width_current,
# main.c:167: 	char* editor_lines = "0:";
	lea	rax, .LC11[rip]	# tmp86,
	mov	QWORD PTR -32[rbp], rax	# editor_lines, tmp86
# main.c:169: 	for(int i = FONT_SIZE; i <= SCREEN_HEIGHT; i+=FONT_SIZE){
	mov	DWORD PTR -44[rbp], 6	# i,
# main.c:169: 	for(int i = FONT_SIZE; i <= SCREEN_HEIGHT; i+=FONT_SIZE){
	jmp	.L32	#
.L33:
# main.c:170: 		asprintf(&editor_lines, "%s\n%d:", editor_lines, i/FONT_SIZE);
	mov	eax, DWORD PTR -44[rbp]	# tmp87, i
	movsx	rdx, eax	# tmp88, tmp87
	imul	rdx, rdx, 715827883	# tmp89, tmp88,
	shr	rdx, 32	# tmp90,
	sar	eax, 31	# tmp91,
	mov	ecx, edx	# _1, tmp90
	sub	ecx, eax	# _1, tmp91
	mov	rdx, QWORD PTR -32[rbp]	# editor_lines.11_2, editor_lines
	lea	rax, -32[rbp]	# tmp92,
	lea	rsi, .LC12[rip]	# tmp93,
	mov	rdi, rax	#, tmp92
	mov	eax, 0	#,
	call	asprintf@PLT	#
# main.c:169: 	for(int i = FONT_SIZE; i <= SCREEN_HEIGHT; i+=FONT_SIZE){
	add	DWORD PTR -44[rbp], 6	# i,
.L32:
# main.c:169: 	for(int i = FONT_SIZE; i <= SCREEN_HEIGHT; i+=FONT_SIZE){
	cmp	DWORD PTR -44[rbp], 500	# i,
	jle	.L33	#,
# main.c:172: 	DrawText(editor_lines, 0, 0, FONT_SIZE, WHITE);
	mov	bl, -1	# D.5611,
	mov	eax, -1	# tmp94,
	mov	bh, al	# D.5611, tmp94
	mov	eax, ebx	# D.5611, D.5611
	or	eax, 16711680	# D.5611,
	mov	ebx, eax	# D.5611, tmp96
	mov	eax, ebx	# D.5611, D.5611
	or	eax, -16777216	# D.5611,
	mov	ebx, eax	# D.5611, tmp98
# main.c:172: 	DrawText(editor_lines, 0, 0, FONT_SIZE, WHITE);
	mov	rax, QWORD PTR -32[rbp]	# editor_lines.12_3, editor_lines
	mov	r8d, ebx	#, D.5611
	mov	ecx, 6	#,
	mov	edx, 0	#,
	mov	esi, 0	#,
	mov	rdi, rax	#, editor_lines.12_3
	call	DrawText@PLT	#
# main.c:173: }
	nop	
	mov	rax, QWORD PTR -24[rbp]	# tmp100, D.5708
	sub	rax, QWORD PTR fs:40	# tmp100, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L34	#,
	call	__stack_chk_fail@PLT	#
.L34:
	mov	rbx, QWORD PTR -8[rbp]	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	setup_line_numbers, .-setup_line_numbers
	.globl	text_area
	.type	text_area, @function
text_area:
.LFB14:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r12	#
	push	rbx	#
	sub	rsp, 96	#,
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	QWORD PTR -88[rbp], xmm0	# pos, pos
	movq	QWORD PTR -96[rbp], xmm1	# size, size
	mov	DWORD PTR -100[rbp], edi	# color, color
	movss	DWORD PTR -104[rbp], xmm2	# border_thickness, border_thickness
	mov	QWORD PTR -112[rbp], rsi	# filepath, filepath
# main.c:175: void text_area(Vector2 pos, Vector2 size, Color color, float border_thickness, char filepath[]){
	mov	rax, QWORD PTR fs:40	# tmp151, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -24[rbp], rax	# D.5711, tmp151
	xor	eax, eax	# tmp151
	mov	rax, rsp	# tmp110,
	mov	r12, rax	# saved_stack.14_28, tmp110
# main.c:176: 	char text_buffer[(int)size.x/FONT_SIZE];
	movss	xmm0, DWORD PTR -96[rbp]	# _1, size.x
# main.c:176: 	char text_buffer[(int)size.x/FONT_SIZE];
	cvttss2si	eax, xmm0	# _2, _1
# main.c:176: 	char text_buffer[(int)size.x/FONT_SIZE];
	movsx	rdx, eax	# tmp111, _2
	imul	rdx, rdx, 715827883	# tmp112, tmp111,
	shr	rdx, 32	# tmp113,
	sar	eax, 31	# _2,
	mov	ecx, eax	# tmp114, _2
	mov	eax, edx	# _29, tmp113
	sub	eax, ecx	# _29, tmp114
	movsx	rdx, eax	# _3, _29
# main.c:176: 	char text_buffer[(int)size.x/FONT_SIZE];
	sub	rdx, 1	# _4,
	mov	QWORD PTR -72[rbp], rdx	# D.5673, _5
	movsx	rdx, eax	# _6, _29
	mov	r10, rdx	# _7, _6
	mov	r11d, 0	# _7,
	movsx	rdx, eax	# _10, _29
	mov	r8, rdx	# _11, _10
	mov	r9d, 0	# _11,
	cdqe
	mov	edx, 16	# tmp149,
	sub	rdx, 1	# tmp115,
	add	rax, rdx	# tmp116, tmp115
	mov	esi, 16	# tmp150,
	mov	edx, 0	# tmp119,
	div	rsi	# tmp150
	imul	rax, rax, 16	# tmp120, tmp118,
	mov	rcx, rax	# tmp122, tmp120
	and	rcx, -4096	# tmp122,
	mov	rdx, rsp	# tmp123,
	sub	rdx, rcx	# tmp123, tmp122
.L36:
	cmp	rsp, rdx	#, tmp123
	je	.L37	#,
	sub	rsp, 4096	#,
	or	QWORD PTR 4088[rsp], 0	#,
	jmp	.L36	#
.L37:
	mov	rdx, rax	# tmp124, tmp120
	and	edx, 4095	# tmp124,
	sub	rsp, rdx	#, tmp124
	mov	rdx, rax	# tmp125, tmp120
	and	edx, 4095	# tmp125,
	test	rdx, rdx	# tmp125
	je	.L38	#,
	and	eax, 4095	# tmp126,
	sub	rax, 8	# tmp126,
	add	rax, rsp	# tmp127,
	or	QWORD PTR [rax], 0	#,
.L38:
	mov	rax, rsp	# tmp121,
	add	rax, 0	# tmp128,
	mov	QWORD PTR -64[rbp], rax	# text_buffer.13, tmp128
# main.c:177: 	char* filedata = LoadFileText(filepath);
	mov	rax, QWORD PTR -112[rbp]	# tmp129, filepath
	mov	rdi, rax	#, tmp129
	call	LoadFileText@PLT	#
	mov	QWORD PTR -56[rbp], rax	# filedata, tmp130
# main.c:181: 			.x = pos.x,
	movss	xmm0, DWORD PTR -88[rbp]	# _14, pos.x
# main.c:180: 	Rectangle text_area_border = {
	movss	DWORD PTR -48[rbp], xmm0	# text_area_border.x, _14
# main.c:182: 			.y = pos.y,
	movss	xmm0, DWORD PTR -84[rbp]	# _15, pos.y
# main.c:180: 	Rectangle text_area_border = {
	movss	DWORD PTR -44[rbp], xmm0	# text_area_border.y, _15
# main.c:183: 			.width = size.x,
	movss	xmm0, DWORD PTR -96[rbp]	# _16, size.x
# main.c:180: 	Rectangle text_area_border = {
	movss	DWORD PTR -40[rbp], xmm0	# text_area_border.width, _16
# main.c:184: 			.height = size.y
	movss	xmm0, DWORD PTR -92[rbp]	# _17, size.y
# main.c:180: 	Rectangle text_area_border = {
	movss	DWORD PTR -36[rbp], xmm0	# text_area_border.height, _17
# main.c:187: 	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
	movss	xmm1, DWORD PTR -48[rbp]	# _18, text_area_border.x
# main.c:187: 	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
	movss	xmm0, DWORD PTR .LC13[rip]	# tmp131,
	addss	xmm0, xmm1	# _19, _18
# main.c:187: 	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
	movd	edx, xmm0	# tmp133, tmp132
	movabs	rax, -4294967296	# tmp135,
	and	rax, rbx	# tmp134, D.5626
	or	rax, rdx	# tmp136, tmp133
	mov	rbx, rax	# D.5626, tmp136
# main.c:187: 	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
	movss	xmm1, DWORD PTR -44[rbp]	# _20, text_area_border.y
# main.c:187: 	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
	movss	xmm0, DWORD PTR .LC13[rip]	# tmp137,
	addss	xmm0, xmm1	# _21, _20
# main.c:187: 	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
	movd	eax, xmm0	# tmp139, tmp138
	sal	rax, 32	# tmp140,
	mov	edx, ebx	# tmp141, D.5626
	or	rax, rdx	# tmp142, tmp141
	mov	rbx, rax	# D.5626, tmp142
# main.c:187: 	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
	movq	xmm0, rbx	#, D.5626
	call	setup_line_numbers	#
# main.c:189: 	DrawRectangleLinesEx(text_area_border, border_thickness, color);
	mov	eax, DWORD PTR -100[rbp]	# tmp143, color
	movss	xmm0, DWORD PTR -104[rbp]	# tmp144, border_thickness
	mov	rdx, QWORD PTR -48[rbp]	# tmp145, text_area_border
	mov	rcx, QWORD PTR -40[rbp]	# tmp146, text_area_border
	mov	edi, eax	#, tmp143
	movaps	xmm2, xmm0	#, tmp144
	movq	xmm0, rdx	#, tmp145
	movq	xmm1, rcx	#, tmp146
	call	DrawRectangleLinesEx@PLT	#
# main.c:190: 	DrawText(filedata, pos.x, pos.y, FONT_SIZE, color);
	movss	xmm0, DWORD PTR -84[rbp]	# _22, pos.y
# main.c:190: 	DrawText(filedata, pos.x, pos.y, FONT_SIZE, color);
	cvttss2si	edx, xmm0	# _23, _22
# main.c:190: 	DrawText(filedata, pos.x, pos.y, FONT_SIZE, color);
	movss	xmm0, DWORD PTR -88[rbp]	# _24, pos.x
# main.c:190: 	DrawText(filedata, pos.x, pos.y, FONT_SIZE, color);
	cvttss2si	esi, xmm0	# _25, _24
	mov	ecx, DWORD PTR -100[rbp]	# tmp147, color
	mov	rax, QWORD PTR -56[rbp]	# tmp148, filedata
	mov	r8d, ecx	#, tmp147
	mov	ecx, 6	#,
	mov	rdi, rax	#, tmp148
	call	DrawText@PLT	#
	mov	rsp, r12	#, saved_stack.14_28
# main.c:191: }
	nop	
	mov	rax, QWORD PTR -24[rbp]	# tmp152, D.5711
	sub	rax, QWORD PTR fs:40	# tmp152, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L39	#,
	call	__stack_chk_fail@PLT	#
.L39:
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r12	#
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	text_area, .-text_area
	.section	.rodata
.LC14:
	.string	"main.c"
.LC15:
	.string	"main,s"
.LC16:
	.string	"BLOCK: ||%s||\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
# main.c:195: 	char* src_file = "main.c";
	lea	rax, .LC14[rip]	# tmp94,
	mov	QWORD PTR -24[rbp], rax	# src_file, tmp94
# main.c:196: 	char* asm_file = "main,s";
	lea	rax, .LC15[rip]	# tmp95,
	mov	QWORD PTR -16[rbp], rax	# asm_file, tmp95
# main.c:198: 	create_buid_asm(src_file);
	mov	rax, QWORD PTR -24[rbp]	# tmp96, src_file
	mov	rdi, rax	#, tmp96
	call	create_buid_asm	#
# main.c:204: 	MapSrc* ms = prepare_src_list(src_file);
	mov	rax, QWORD PTR -24[rbp]	# tmp97, src_file
	mov	rdi, rax	#, tmp97
	call	prepare_src_list	#
	mov	QWORD PTR -8[rbp], rax	# ms, tmp98
# main.c:205: 	MapSrc* tmp = ms;
	mov	rax, QWORD PTR -8[rbp]	# tmp99, ms
	mov	QWORD PTR -32[rbp], rax	# tmp, tmp99
# main.c:206: 	scan_asm_blocks(src_file, asm_file, ms);
	mov	rdx, QWORD PTR -8[rbp]	# tmp100, ms
	mov	rcx, QWORD PTR -16[rbp]	# tmp101, asm_file
	mov	rax, QWORD PTR -24[rbp]	# tmp102, src_file
	mov	rsi, rcx	#, tmp101
	mov	rdi, rax	#, tmp102
	call	scan_asm_blocks	#
# main.c:208: 	while(tmp != NULL){
	jmp	.L41	#
.L42:
# main.c:209: 		printf("BLOCK: ||%s||\n", tmp->asm_block);
	mov	rax, QWORD PTR -32[rbp]	# tmp103, tmp
	add	rax, 40	# _1,
# main.c:209: 		printf("BLOCK: ||%s||\n", tmp->asm_block);
	mov	rsi, rax	#, _1
	lea	rax, .LC16[rip]	# tmp104,
	mov	rdi, rax	#, tmp104
	mov	eax, 0	#,
	call	printf@PLT	#
# main.c:210: 		tmp = tmp->child;
	mov	rax, QWORD PTR -32[rbp]	# tmp105, tmp
	mov	rax, QWORD PTR 8[rax]	# tmp106, tmp_2->child
	mov	QWORD PTR -32[rbp], rax	# tmp, tmp106
.L41:
# main.c:208: 	while(tmp != NULL){
	cmp	QWORD PTR -32[rbp], 0	# tmp,
	jne	.L42	#,
# main.c:217: 	return 0;
	mov	eax, 0	# _12,
# main.c:239: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC13:
	.long	1084227584
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
