	.file	"worm.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.local	KEY
	.comm	KEY,1,1
	.section	.rodata
.LC0:
	.string	"Worm Game - v0.1"
.LC4:
	.string	"x: %f, y: %f   key:%d\n"
.LC7:
	.string	"Game score: %d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB148:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	rbx	#
	sub	rsp, 104	#,
	.cfi_offset 3, -24
	mov	DWORD PTR -84[rbp], edi	# argc, argc
	mov	QWORD PTR -96[rbp], rsi	# argv, argv
# worm.c:44: 	InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Worm Game - v0.1");
	lea	rax, .LC0[rip]	# tmp138,
	mov	rdx, rax	#, tmp138
	mov	esi, 800	#,
	mov	edi, 800	#,
	call	InitWindow@PLT	#
# worm.c:45: 	SetTargetFPS(FPS_LIMIT);
	mov	edi, 120	#,
	call	SetTargetFPS@PLT	#
# worm.c:47: 	Player* head_player = (Player*) malloc(sizeof(Player));
	mov	edi, 48	#,
	call	malloc@PLT	#
	mov	QWORD PTR -72[rbp], rax	# head_player, tmp139
# worm.c:49: 		GetRandomValue(0, CELL_COUNT_X-1) * CELL_WIDTH,
	mov	esi, 49	#,
	mov	edi, 0	#,
	call	GetRandomValue@PLT	#
# worm.c:49: 		GetRandomValue(0, CELL_COUNT_X-1) * CELL_WIDTH,
	sal	eax, 4	# _2,
# worm.c:48: 	head_player->rect = (Rectangle) {
	pxor	xmm4, xmm4	# _3
	cvtsi2ss	xmm4, eax	# _3, _2
	movss	DWORD PTR -88[rbp], xmm4	# %sfp, _3
# worm.c:50: 	 	GetRandomValue(0, CELL_COUNT_Y-1) * CELL_HEIGHT,
	mov	esi, 49	#,
	mov	edi, 0	#,
	call	GetRandomValue@PLT	#
# worm.c:50: 	 	GetRandomValue(0, CELL_COUNT_Y-1) * CELL_HEIGHT,
	sal	eax, 4	# _5,
# worm.c:48: 	head_player->rect = (Rectangle) {
	pxor	xmm0, xmm0	# _6
	cvtsi2ss	xmm0, eax	# _6, _5
	mov	rax, QWORD PTR -72[rbp]	# tmp140, head_player
	movss	xmm4, DWORD PTR -88[rbp]	# _3, %sfp
	movss	DWORD PTR [rax], xmm4	# head_player_67->rect.x, _3
	mov	rax, QWORD PTR -72[rbp]	# tmp141, head_player
	movss	DWORD PTR 4[rax], xmm0	# head_player_67->rect.y, _6
	mov	rax, QWORD PTR -72[rbp]	# tmp142, head_player
	movss	xmm0, DWORD PTR .LC1[rip]	# tmp143,
	movss	DWORD PTR 8[rax], xmm0	# head_player_67->rect.width, tmp143
	mov	rax, QWORD PTR -72[rbp]	# tmp144, head_player
	movss	xmm0, DWORD PTR .LC1[rip]	# tmp145,
	movss	DWORD PTR 12[rax], xmm0	# head_player_67->rect.height, tmp145
# worm.c:54: 	head_player->child_player = NULL;
	mov	rax, QWORD PTR -72[rbp]	# tmp146, head_player
	mov	QWORD PTR 16[rax], 0	# head_player_67->child_player,
# worm.c:55: 	head_player->parent_player = NULL;
	mov	rax, QWORD PTR -72[rbp]	# tmp147, head_player
	mov	QWORD PTR 24[rax], 0	# head_player_67->parent_player,
# worm.c:56: 	head_player->old_position = (Vector2){0};
	mov	rax, QWORD PTR -72[rbp]	# tmp148, head_player
	mov	QWORD PTR 32[rax], 0	# head_player_67->old_position,
# worm.c:57: 	head_player->color = RED;
	mov	rax, QWORD PTR -72[rbp]	# tmp149, head_player
	mov	BYTE PTR 40[rax], -26	# head_player_67->color.r,
	mov	rax, QWORD PTR -72[rbp]	# tmp150, head_player
	mov	BYTE PTR 41[rax], 41	# head_player_67->color.g,
	mov	rax, QWORD PTR -72[rbp]	# tmp151, head_player
	mov	BYTE PTR 42[rax], 55	# head_player_67->color.b,
	mov	rax, QWORD PTR -72[rbp]	# tmp152, head_player
	mov	BYTE PTR 43[rax], -1	# head_player_67->color.a,
# worm.c:59: 	Vector2 velocity = (Vector2){1./FPS_LIMIT * SPEED, 1./FPS_LIMIT * SPEED};
	movss	xmm0, DWORD PTR .LC2[rip]	# tmp153,
	movss	DWORD PTR -56[rbp], xmm0	# velocity.x, tmp153
	movss	xmm0, DWORD PTR .LC2[rip]	# tmp154,
	movss	DWORD PTR -52[rbp], xmm0	# velocity.y, tmp154
# worm.c:60: 	int hold_key = KEY_NULL;
	mov	DWORD PTR -76[rbp], 0	# hold_key,
# worm.c:61: 	Vector2 pos_star = random_star(head_player);
	mov	rax, QWORD PTR -72[rbp]	# tmp155, head_player
	mov	rdi, rax	#, tmp155
	call	random_star	#
	movq	rax, xmm0	# tmp156,
	mov	QWORD PTR -48[rbp], rax	# pos_star, tmp157
# worm.c:62: 	Rectangle rect_star = (Rectangle){pos_star.x, pos_star.y, 30, 30};
	movss	xmm0, DWORD PTR -48[rbp]	# _7, pos_star.x
# worm.c:62: 	Rectangle rect_star = (Rectangle){pos_star.x, pos_star.y, 30, 30};
	movss	DWORD PTR -32[rbp], xmm0	# rect_star.x, _7
# worm.c:62: 	Rectangle rect_star = (Rectangle){pos_star.x, pos_star.y, 30, 30};
	movss	xmm0, DWORD PTR -44[rbp]	# _8, pos_star.y
# worm.c:62: 	Rectangle rect_star = (Rectangle){pos_star.x, pos_star.y, 30, 30};
	movss	DWORD PTR -28[rbp], xmm0	# rect_star.y, _8
	movss	xmm0, DWORD PTR .LC3[rip]	# tmp158,
	movss	DWORD PTR -24[rbp], xmm0	# rect_star.width, tmp158
	movss	xmm0, DWORD PTR .LC3[rip]	# tmp159,
	movss	DWORD PTR -20[rbp], xmm0	# rect_star.height, tmp159
# worm.c:63: 	char* game_score = (char*)malloc(25 * sizeof(char));
	mov	edi, 25	#,
	call	malloc@PLT	#
	mov	QWORD PTR -64[rbp], rax	# game_score, tmp160
# worm.c:65: 	while(!WindowShouldClose()){
	jmp	.L2	#
.L20:
# worm.c:66: 		printf("x: %f, y: %f   key:%d\n", head_player->rect.x, head_player->rect.y, count_players(head_player));
	mov	rax, QWORD PTR -72[rbp]	# tmp161, head_player
	mov	rdi, rax	#, tmp161
	call	count_players	#
	mov	edx, eax	# _9,
# worm.c:66: 		printf("x: %f, y: %f   key:%d\n", head_player->rect.x, head_player->rect.y, count_players(head_player));
	mov	rax, QWORD PTR -72[rbp]	# tmp162, head_player
	movss	xmm0, DWORD PTR 4[rax]	# _10, head_player_67->rect.y
# worm.c:66: 		printf("x: %f, y: %f   key:%d\n", head_player->rect.x, head_player->rect.y, count_players(head_player));
	cvtss2sd	xmm0, xmm0	# _11, _10
# worm.c:66: 		printf("x: %f, y: %f   key:%d\n", head_player->rect.x, head_player->rect.y, count_players(head_player));
	mov	rax, QWORD PTR -72[rbp]	# tmp163, head_player
	movss	xmm1, DWORD PTR [rax]	# _12, head_player_67->rect.x
# worm.c:66: 		printf("x: %f, y: %f   key:%d\n", head_player->rect.x, head_player->rect.y, count_players(head_player));
	pxor	xmm5, xmm5	# _13
	cvtss2sd	xmm5, xmm1	# _13, _12
	movq	rax, xmm5	# _13, _13
	mov	esi, edx	#, _9
	movapd	xmm1, xmm0	#, _11
	movq	xmm0, rax	#, _13
	lea	rax, .LC4[rip]	# tmp164,
	mov	rdi, rax	#, tmp164
	mov	eax, 2	#,
	call	printf@PLT	#
# worm.c:68: 		head_player->old_position = (Vector2){ head_player->rect.x, head_player->rect.y };
	mov	rax, QWORD PTR -72[rbp]	# tmp165, head_player
	movss	xmm1, DWORD PTR [rax]	# _14, head_player_67->rect.x
# worm.c:68: 		head_player->old_position = (Vector2){ head_player->rect.x, head_player->rect.y };
	mov	rax, QWORD PTR -72[rbp]	# tmp166, head_player
	movss	xmm0, DWORD PTR 4[rax]	# _15, head_player_67->rect.y
# worm.c:68: 		head_player->old_position = (Vector2){ head_player->rect.x, head_player->rect.y };
	mov	rax, QWORD PTR -72[rbp]	# tmp167, head_player
	movss	DWORD PTR 32[rax], xmm1	# head_player_67->old_position.x, _14
	mov	rax, QWORD PTR -72[rbp]	# tmp168, head_player
	movss	DWORD PTR 36[rax], xmm0	# head_player_67->old_position.y, _15
# worm.c:70: 		if(hold_key == KEY_UP || IsKeyDown(KEY_UP)){
	cmp	DWORD PTR -76[rbp], 265	# hold_key,
	je	.L3	#,
# worm.c:70: 		if(hold_key == KEY_UP || IsKeyDown(KEY_UP)){
	mov	edi, 265	#,
	call	IsKeyDown@PLT	#
# worm.c:70: 		if(hold_key == KEY_UP || IsKeyDown(KEY_UP)){
	test	al, al	# _16
	je	.L4	#,
.L3:
# worm.c:71: 			head_player->rect.y -= velocity.y;
	mov	rax, QWORD PTR -72[rbp]	# tmp169, head_player
	movss	xmm0, DWORD PTR 4[rax]	# _17, head_player_67->rect.y
# worm.c:71: 			head_player->rect.y -= velocity.y;
	movss	xmm1, DWORD PTR -52[rbp]	# _18, velocity.y
# worm.c:71: 			head_player->rect.y -= velocity.y;
	subss	xmm0, xmm1	# _19, _18
	mov	rax, QWORD PTR -72[rbp]	# tmp170, head_player
	movss	DWORD PTR 4[rax], xmm0	# head_player_67->rect.y, _19
# worm.c:72: 			hold_key = KEY_UP;
	mov	DWORD PTR -76[rbp], 265	# hold_key,
.L4:
# worm.c:74: 		if(hold_key == KEY_DOWN || IsKeyDown(KEY_DOWN)){
	cmp	DWORD PTR -76[rbp], 264	# hold_key,
	je	.L5	#,
# worm.c:74: 		if(hold_key == KEY_DOWN || IsKeyDown(KEY_DOWN)){
	mov	edi, 264	#,
	call	IsKeyDown@PLT	#
# worm.c:74: 		if(hold_key == KEY_DOWN || IsKeyDown(KEY_DOWN)){
	test	al, al	# _20
	je	.L6	#,
.L5:
# worm.c:75: 			head_player->rect.y += velocity.y;
	mov	rax, QWORD PTR -72[rbp]	# tmp171, head_player
	movss	xmm1, DWORD PTR 4[rax]	# _21, head_player_67->rect.y
# worm.c:75: 			head_player->rect.y += velocity.y;
	movss	xmm0, DWORD PTR -52[rbp]	# _22, velocity.y
# worm.c:75: 			head_player->rect.y += velocity.y;
	addss	xmm0, xmm1	# _23, _21
	mov	rax, QWORD PTR -72[rbp]	# tmp172, head_player
	movss	DWORD PTR 4[rax], xmm0	# head_player_67->rect.y, _23
# worm.c:76: 			hold_key = KEY_DOWN;
	mov	DWORD PTR -76[rbp], 264	# hold_key,
.L6:
# worm.c:78: 		if(hold_key == KEY_RIGHT || IsKeyDown(KEY_RIGHT)){
	cmp	DWORD PTR -76[rbp], 262	# hold_key,
	je	.L7	#,
# worm.c:78: 		if(hold_key == KEY_RIGHT || IsKeyDown(KEY_RIGHT)){
	mov	edi, 262	#,
	call	IsKeyDown@PLT	#
# worm.c:78: 		if(hold_key == KEY_RIGHT || IsKeyDown(KEY_RIGHT)){
	test	al, al	# _24
	je	.L8	#,
.L7:
# worm.c:79: 			head_player->rect.x += velocity.x;
	mov	rax, QWORD PTR -72[rbp]	# tmp173, head_player
	movss	xmm1, DWORD PTR [rax]	# _25, head_player_67->rect.x
# worm.c:79: 			head_player->rect.x += velocity.x;
	movss	xmm0, DWORD PTR -56[rbp]	# _26, velocity.x
# worm.c:79: 			head_player->rect.x += velocity.x;
	addss	xmm0, xmm1	# _27, _25
	mov	rax, QWORD PTR -72[rbp]	# tmp174, head_player
	movss	DWORD PTR [rax], xmm0	# head_player_67->rect.x, _27
# worm.c:80: 			hold_key = KEY_RIGHT;
	mov	DWORD PTR -76[rbp], 262	# hold_key,
.L8:
# worm.c:82: 		if(hold_key == KEY_LEFT || IsKeyDown(KEY_LEFT)){
	cmp	DWORD PTR -76[rbp], 263	# hold_key,
	je	.L9	#,
# worm.c:82: 		if(hold_key == KEY_LEFT || IsKeyDown(KEY_LEFT)){
	mov	edi, 263	#,
	call	IsKeyDown@PLT	#
# worm.c:82: 		if(hold_key == KEY_LEFT || IsKeyDown(KEY_LEFT)){
	test	al, al	# _28
	je	.L10	#,
.L9:
# worm.c:83: 			head_player->rect.x -= velocity.x;
	mov	rax, QWORD PTR -72[rbp]	# tmp175, head_player
	movss	xmm0, DWORD PTR [rax]	# _29, head_player_67->rect.x
# worm.c:83: 			head_player->rect.x -= velocity.x;
	movss	xmm1, DWORD PTR -56[rbp]	# _30, velocity.x
# worm.c:83: 			head_player->rect.x -= velocity.x;
	subss	xmm0, xmm1	# _31, _30
	mov	rax, QWORD PTR -72[rbp]	# tmp176, head_player
	movss	DWORD PTR [rax], xmm0	# head_player_67->rect.x, _31
# worm.c:84: 			hold_key = KEY_LEFT;
	mov	DWORD PTR -76[rbp], 263	# hold_key,
.L10:
# worm.c:87: 		if(head_player->rect.y > SCREEN_HEIGHT - 3*CELL_HEIGHT ){
	mov	rax, QWORD PTR -72[rbp]	# tmp177, head_player
	movss	xmm0, DWORD PTR 4[rax]	# _32, head_player_67->rect.y
# worm.c:87: 		if(head_player->rect.y > SCREEN_HEIGHT - 3*CELL_HEIGHT ){
	comiss	xmm0, DWORD PTR .LC5[rip]	# _32,
	jbe	.L11	#,
# worm.c:88: 			head_player->rect.y = SCREEN_HEIGHT-3*CELL_HEIGHT;	
	mov	rax, QWORD PTR -72[rbp]	# tmp178, head_player
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp179,
	movss	DWORD PTR 4[rax], xmm0	# head_player_67->rect.y, tmp179
.L11:
# worm.c:90: 		if(head_player->rect.y < 0){
	mov	rax, QWORD PTR -72[rbp]	# tmp180, head_player
	movss	xmm1, DWORD PTR 4[rax]	# _33, head_player_67->rect.y
# worm.c:90: 		if(head_player->rect.y < 0){
	pxor	xmm0, xmm0	# tmp181
	comiss	xmm0, xmm1	# tmp181, _33
	jbe	.L13	#,
# worm.c:91: 			head_player->rect.y = 0;
	mov	rax, QWORD PTR -72[rbp]	# tmp182, head_player
	pxor	xmm0, xmm0	# tmp183
	movss	DWORD PTR 4[rax], xmm0	# head_player_67->rect.y, tmp183
.L13:
# worm.c:93: 		if(head_player->rect.x < 0){
	mov	rax, QWORD PTR -72[rbp]	# tmp184, head_player
	movss	xmm1, DWORD PTR [rax]	# _34, head_player_67->rect.x
# worm.c:93: 		if(head_player->rect.x < 0){
	pxor	xmm0, xmm0	# tmp185
	comiss	xmm0, xmm1	# tmp185, _34
	jbe	.L15	#,
# worm.c:94: 			head_player->rect.x = 0;
	mov	rax, QWORD PTR -72[rbp]	# tmp186, head_player
	pxor	xmm0, xmm0	# tmp187
	movss	DWORD PTR [rax], xmm0	# head_player_67->rect.x, tmp187
.L15:
# worm.c:96: 		if(head_player->rect.x > SCREEN_WIDTH - 3*CELL_WIDTH ){
	mov	rax, QWORD PTR -72[rbp]	# tmp188, head_player
	movss	xmm0, DWORD PTR [rax]	# _35, head_player_67->rect.x
# worm.c:96: 		if(head_player->rect.x > SCREEN_WIDTH - 3*CELL_WIDTH ){
	comiss	xmm0, DWORD PTR .LC5[rip]	# _35,
	jbe	.L17	#,
# worm.c:97: 			head_player->rect.x = SCREEN_WIDTH-3*CELL_WIDTH;	
	mov	rax, QWORD PTR -72[rbp]	# tmp189, head_player
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp190,
	movss	DWORD PTR [rax], xmm0	# head_player_67->rect.x, tmp190
.L17:
# worm.c:100: 		sprintf(game_score, "Game score: %d", count_players(head_player));
	mov	rax, QWORD PTR -72[rbp]	# tmp191, head_player
	mov	rdi, rax	#, tmp191
	call	count_players	#
	mov	edx, eax	# _36,
	mov	rax, QWORD PTR -64[rbp]	# tmp192, game_score
	lea	rcx, .LC7[rip]	# tmp193,
	mov	rsi, rcx	#, tmp193
	mov	rdi, rax	#, tmp192
	mov	eax, 0	#,
	call	sprintf@PLT	#
# worm.c:103: 		Vector2 head_player_pos = (Vector2){head_player->rect.x, head_player->rect.y};
	mov	rax, QWORD PTR -72[rbp]	# tmp194, head_player
	movss	xmm0, DWORD PTR [rax]	# _37, head_player_67->rect.x
# worm.c:103: 		Vector2 head_player_pos = (Vector2){head_player->rect.x, head_player->rect.y};
	movss	DWORD PTR -40[rbp], xmm0	# head_player_pos.x, _37
# worm.c:103: 		Vector2 head_player_pos = (Vector2){head_player->rect.x, head_player->rect.y};
	mov	rax, QWORD PTR -72[rbp]	# tmp195, head_player
	movss	xmm0, DWORD PTR 4[rax]	# _38, head_player_67->rect.y
# worm.c:103: 		Vector2 head_player_pos = (Vector2){head_player->rect.x, head_player->rect.y};
	movss	DWORD PTR -36[rbp], xmm0	# head_player_pos.y, _38
# worm.c:104: 		if(CheckCollisionRecs(head_player->rect, rect_star)){
	mov	rsi, QWORD PTR -32[rbp]	# tmp196, rect_star
	mov	rcx, QWORD PTR -24[rbp]	# tmp197, rect_star
	mov	rax, QWORD PTR -72[rbp]	# tmp198, head_player
	mov	rdx, QWORD PTR [rax]	# tmp199, head_player_67->rect
	mov	rax, QWORD PTR 8[rax]	# tmp200, head_player_67->rect
	movq	xmm2, rsi	#, tmp196
	movq	xmm3, rcx	#, tmp197
	movq	xmm0, rdx	#, tmp199
	movq	xmm1, rax	#, tmp200
	call	CheckCollisionRecs@PLT	#
# worm.c:104: 		if(CheckCollisionRecs(head_player->rect, rect_star)){
	test	al, al	# _39
	je	.L19	#,
# worm.c:105: 			pos_star = random_star(head_player);
	mov	rax, QWORD PTR -72[rbp]	# tmp201, head_player
	mov	rdi, rax	#, tmp201
	call	random_star	#
	movq	rax, xmm0	# tmp202,
	mov	QWORD PTR -48[rbp], rax	# pos_star, tmp203
# worm.c:106: 			rect_star = (Rectangle){ pos_star.x, pos_star.y, 30., 30. };
	movss	xmm1, DWORD PTR -48[rbp]	# _40, pos_star.x
# worm.c:106: 			rect_star = (Rectangle){ pos_star.x, pos_star.y, 30., 30. };
	movss	xmm0, DWORD PTR -44[rbp]	# _41, pos_star.y
# worm.c:106: 			rect_star = (Rectangle){ pos_star.x, pos_star.y, 30., 30. };
	movss	DWORD PTR -32[rbp], xmm1	# rect_star.x, _40
	movss	DWORD PTR -28[rbp], xmm0	# rect_star.y, _41
	movss	xmm0, DWORD PTR .LC3[rip]	# tmp204,
	movss	DWORD PTR -24[rbp], xmm0	# rect_star.width, tmp204
	movss	xmm0, DWORD PTR .LC3[rip]	# tmp205,
	movss	DWORD PTR -20[rbp], xmm0	# rect_star.height, tmp205
# worm.c:107: 			extend_player(head_player);
	mov	rax, QWORD PTR -72[rbp]	# tmp206, head_player
	mov	rdi, rax	#, tmp206
	call	extend_player	#
.L19:
# worm.c:110: 		domino_positions(head_player);
	mov	rax, QWORD PTR -72[rbp]	# tmp207, head_player
	mov	rdi, rax	#, tmp207
	call	domino_positions	#
# worm.c:112: 		BeginDrawing();
	call	BeginDrawing@PLT	#
# worm.c:113: 		draw_player(head_player);
	mov	rax, QWORD PTR -72[rbp]	# tmp208, head_player
	mov	rdi, rax	#, tmp208
	call	draw_player	#
# worm.c:114: 		DrawRectangleRec(rect_star, BLUE);
	mov	bl, 0	# D.8579,
	mov	eax, 121	# tmp209,
	mov	bh, al	# D.8579, tmp209
	mov	eax, ebx	# D.8579, D.8579
	and	eax, -16711681	# D.8579,
	or	eax, 15794176	# tmp212,
	mov	ebx, eax	# D.8579, tmp212
	mov	eax, ebx	# D.8579, D.8579
	or	eax, -16777216	# D.8579,
	mov	ebx, eax	# D.8579, tmp214
# worm.c:114: 		DrawRectangleRec(rect_star, BLUE);
	mov	rax, QWORD PTR -32[rbp]	# tmp215, rect_star
	mov	rdx, QWORD PTR -24[rbp]	# tmp216, rect_star
	mov	edi, ebx	#, D.8579
	movq	xmm0, rax	#, tmp215
	movq	xmm1, rdx	#, tmp216
	call	DrawRectangleRec@PLT	#
# worm.c:115: 		DrawText(game_score, 0, 0, 12, GREEN);
	mov	ecx, DWORD PTR -100[rbp]	# D.8580, %sfp
	mov	cl, 0	# D.8580,
	mov	eax, -28	# tmp217,
	mov	ch, al	# D.8580, tmp217
	and	ecx, -16711681	# D.8580,
	mov	eax, ecx	# tmp219, D.8580
	or	eax, 3145728	# tmp220,
	or	eax, -16777216	# D.8580,
	mov	ecx, eax	# D.8580, tmp222
	mov	DWORD PTR -100[rbp], ecx	# %sfp, D.8580
# worm.c:115: 		DrawText(game_score, 0, 0, 12, GREEN);
	mov	rax, QWORD PTR -64[rbp]	# tmp223, game_score
	mov	r8d, ecx	#, D.8580
	mov	ecx, 12	#,
	mov	edx, 0	#,
	mov	esi, 0	#,
	mov	rdi, rax	#, tmp223
	call	DrawText@PLT	#
# worm.c:116: 		DrawFPS(SCREEN_WIDTH-100, 0);
	mov	esi, 0	#,
	mov	edi, 700	#,
	call	DrawFPS@PLT	#
# worm.c:117: 		ClearBackground(BLACK);
	mov	edx, DWORD PTR -104[rbp]	# D.8581, %sfp
	mov	dl, 0	# D.8581,
	mov	eax, 0	# tmp224,
	mov	dh, al	# D.8581, tmp224
	and	edx, -16711681	# D.8581,
	mov	eax, edx	# tmp226, D.8581
	or	eax, -16777216	# D.8581,
	mov	DWORD PTR -104[rbp], eax	# %sfp, D.8581
# worm.c:117: 		ClearBackground(BLACK);
	mov	edi, eax	#, D.8581
	call	ClearBackground@PLT	#
# worm.c:118: 		EndDrawing();
	call	EndDrawing@PLT	#
.L2:
# worm.c:65: 	while(!WindowShouldClose()){
	call	WindowShouldClose@PLT	#
# worm.c:65: 	while(!WindowShouldClose()){
	xor	eax, 1	# _43,
	test	al, al	# _43
	jne	.L20	#,
# worm.c:121: 	CloseWindow();
	call	CloseWindow@PLT	#
# worm.c:123:     return 0;
	mov	eax, 0	# _93,
# worm.c:124: }
	mov	rbx, QWORD PTR -8[rbp]	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE148:
	.size	main, .-main
	.type	random_star, @function
random_star:
.LFB149:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# head_player, head_player
.L27:
# worm.c:130: 		pn.x = GetRandomValue(0, SCREEN_HEIGHT - CELL_HEIGHT*3);
	mov	esi, 752	#,
	mov	edi, 0	#,
	call	GetRandomValue@PLT	#
# worm.c:130: 		pn.x = GetRandomValue(0, SCREEN_HEIGHT - CELL_HEIGHT*3);
	pxor	xmm0, xmm0	# _2
	cvtsi2ss	xmm0, eax	# _2, _1
	movss	DWORD PTR -8[rbp], xmm0	# pn.x, _2
# worm.c:131: 		pn.y = GetRandomValue(0, SCREEN_WIDTH - CELL_WIDTH*3);
	mov	esi, 752	#,
	mov	edi, 0	#,
	call	GetRandomValue@PLT	#
# worm.c:131: 		pn.y = GetRandomValue(0, SCREEN_WIDTH - CELL_WIDTH*3);
	pxor	xmm0, xmm0	# _4
	cvtsi2ss	xmm0, eax	# _4, _3
	movss	DWORD PTR -4[rbp], xmm0	# pn.y, _4
# worm.c:132: 	}while(point_within_player(head_player, pn));
	mov	rdx, QWORD PTR -8[rbp]	# tmp89, pn
	mov	rax, QWORD PTR -24[rbp]	# tmp90, head_player
	movq	xmm0, rdx	#, tmp89
	mov	rdi, rax	#, tmp90
	call	point_within_player	#
	test	al, al	# _5
	jne	.L27	#,
# worm.c:134:     return pn;
	mov	rax, QWORD PTR -8[rbp]	# D.8662, pn
# worm.c:135: }
	movq	xmm0, rax	#, <retval>
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE149:
	.size	random_star, .-random_star
	.type	point_within_player, @function
point_within_player:
.LFB150:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# head_player, head_player
	movq	QWORD PTR -32[rbp], xmm0	# p, p
# worm.c:138: 	Player* player_next = head_player;
	mov	rax, QWORD PTR -24[rbp]	# tmp88, head_player
	mov	QWORD PTR -8[rbp], rax	# player_next, tmp88
# worm.c:139: 	while(player_next != NULL){
	jmp	.L30	#
.L35:
# worm.c:140: 		if(p.x == player_next->rect.x && p.y == player_next->rect.y){
	movss	xmm0, DWORD PTR -32[rbp]	# _1, p.x
# worm.c:140: 		if(p.x == player_next->rect.x && p.y == player_next->rect.y){
	mov	rax, QWORD PTR -8[rbp]	# tmp89, player_next
	movss	xmm1, DWORD PTR [rax]	# _2, player_next_5->rect.x
# worm.c:140: 		if(p.x == player_next->rect.x && p.y == player_next->rect.y){
	ucomiss	xmm0, xmm1	# _1, _2
	jp	.L31	#,
	ucomiss	xmm0, xmm1	# _1, _2
	jne	.L31	#,
# worm.c:140: 		if(p.x == player_next->rect.x && p.y == player_next->rect.y){
	movss	xmm0, DWORD PTR -28[rbp]	# _3, p.y
# worm.c:140: 		if(p.x == player_next->rect.x && p.y == player_next->rect.y){
	mov	rax, QWORD PTR -8[rbp]	# tmp90, player_next
	movss	xmm1, DWORD PTR 4[rax]	# _4, player_next_5->rect.y
# worm.c:140: 		if(p.x == player_next->rect.x && p.y == player_next->rect.y){
	ucomiss	xmm0, xmm1	# _3, _4
	jp	.L31	#,
	ucomiss	xmm0, xmm1	# _3, _4
	jne	.L31	#,
# worm.c:141: 			return true;
	mov	eax, 1	# _6,
	jmp	.L34	#
.L31:
# worm.c:144: 		player_next = player_next->child_player;
	mov	rax, QWORD PTR -8[rbp]	# tmp91, player_next
	mov	rax, QWORD PTR 16[rax]	# tmp92, player_next_5->child_player
	mov	QWORD PTR -8[rbp], rax	# player_next, tmp92
.L30:
# worm.c:139: 	while(player_next != NULL){
	cmp	QWORD PTR -8[rbp], 0	# player_next,
	jne	.L35	#,
# worm.c:147: 	return false;
	mov	eax, 0	# _6,
.L34:
# worm.c:148: }
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE150:
	.size	point_within_player, .-point_within_player
	.section	.rodata
.LC8:
	.string	"Buy more RAM!"
	.text
	.globl	extend_player
	.type	extend_player, @function
extend_player:
.LFB151:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# head_player, head_player
# worm.c:151:     Player* next_player = head_player;
	mov	rax, QWORD PTR -40[rbp]	# tmp88, head_player
	mov	QWORD PTR -32[rbp], rax	# next_player, tmp88
# worm.c:153: 	while(next_player->child_player != NULL){
	jmp	.L39	#
.L40:
# worm.c:154:         next_player = next_player->child_player;
	mov	rax, QWORD PTR -32[rbp]	# tmp89, next_player
	mov	rax, QWORD PTR 16[rax]	# tmp90, next_player_6->child_player
	mov	QWORD PTR -32[rbp], rax	# next_player, tmp90
.L39:
# worm.c:153: 	while(next_player->child_player != NULL){
	mov	rax, QWORD PTR -32[rbp]	# tmp91, next_player
	mov	rax, QWORD PTR 16[rax]	# _1, next_player_6->child_player
# worm.c:153: 	while(next_player->child_player != NULL){
	test	rax, rax	# _1
	jne	.L40	#,
# worm.c:157: 	Player* new_player = (Player*) malloc(sizeof(Player));
	mov	edi, 48	#,
	call	malloc@PLT	#
	mov	QWORD PTR -24[rbp], rax	# new_player, tmp92
# worm.c:159: 	if(new_player == NULL){
	cmp	QWORD PTR -24[rbp], 0	# new_player,
	jne	.L41	#,
# worm.c:160: 		printf("Buy more RAM!");
	lea	rax, .LC8[rip]	# tmp93,
	mov	rdi, rax	#, tmp93
	mov	eax, 0	#,
	call	printf@PLT	#
# worm.c:161: 		exit(1);
	mov	edi, 1	#,
	call	exit@PLT	#
.L41:
# worm.c:164: 		.x = next_player->old_position.x,
	mov	rax, QWORD PTR -32[rbp]	# tmp94, next_player
	movss	xmm0, DWORD PTR 32[rax]	# _2, next_player_6->old_position.x
# worm.c:163: 	Rectangle rec_new_player = {
	movss	DWORD PTR -16[rbp], xmm0	# rec_new_player.x, _2
# worm.c:165: 		.y = next_player->old_position.y,
	mov	rax, QWORD PTR -32[rbp]	# tmp95, next_player
	movss	xmm0, DWORD PTR 36[rax]	# _3, next_player_6->old_position.y
# worm.c:163: 	Rectangle rec_new_player = {
	movss	DWORD PTR -12[rbp], xmm0	# rec_new_player.y, _3
# worm.c:166: 		.width = next_player->rect.width,
	mov	rax, QWORD PTR -32[rbp]	# tmp96, next_player
	movss	xmm0, DWORD PTR 8[rax]	# _4, next_player_6->rect.width
# worm.c:163: 	Rectangle rec_new_player = {
	movss	DWORD PTR -8[rbp], xmm0	# rec_new_player.width, _4
# worm.c:167: 		.height = next_player->rect.height
	mov	rax, QWORD PTR -32[rbp]	# tmp97, next_player
	movss	xmm0, DWORD PTR 12[rax]	# _5, next_player_6->rect.height
# worm.c:163: 	Rectangle rec_new_player = {
	movss	DWORD PTR -4[rbp], xmm0	# rec_new_player.height, _5
# worm.c:170: 	new_player->rect = rec_new_player;
	mov	rcx, QWORD PTR -24[rbp]	# tmp98, new_player
	mov	rax, QWORD PTR -16[rbp]	# tmp99, rec_new_player
	mov	rdx, QWORD PTR -8[rbp]	#, rec_new_player
	mov	QWORD PTR [rcx], rax	# new_player_11->rect, tmp99
	mov	QWORD PTR 8[rcx], rdx	# new_player_11->rect,
# worm.c:171: 	new_player->child_player = NULL;
	mov	rax, QWORD PTR -24[rbp]	# tmp100, new_player
	mov	QWORD PTR 16[rax], 0	# new_player_11->child_player,
# worm.c:172: 	new_player->parent_player = next_player;
	mov	rax, QWORD PTR -24[rbp]	# tmp101, new_player
	mov	rdx, QWORD PTR -32[rbp]	# tmp102, next_player
	mov	QWORD PTR 24[rax], rdx	# new_player_11->parent_player, tmp102
# worm.c:173: 	new_player->old_position = (Vector2){0};
	mov	rax, QWORD PTR -24[rbp]	# tmp103, new_player
	mov	QWORD PTR 32[rax], 0	# new_player_11->old_position,
# worm.c:174: 	new_player->color = next_player->color;
	mov	rax, QWORD PTR -24[rbp]	# tmp104, new_player
	mov	rdx, QWORD PTR -32[rbp]	# tmp105, next_player
	mov	edx, DWORD PTR 40[rdx]	# tmp106, next_player_6->color
	mov	DWORD PTR 40[rax], edx	# new_player_11->color, tmp106
# worm.c:176: 	next_player->child_player = new_player;
	mov	rax, QWORD PTR -32[rbp]	# tmp107, next_player
	mov	rdx, QWORD PTR -24[rbp]	# tmp108, new_player
	mov	QWORD PTR 16[rax], rdx	# next_player_6->child_player, tmp108
# worm.c:177: }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE151:
	.size	extend_player, .-extend_player
	.section	.rodata
.LC9:
	.string	"%.5f, %.5f"
	.text
	.globl	domino_positions
	.type	domino_positions, @function
domino_positions:
.LFB152:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# head_player, head_player
# worm.c:180:     Player* next_player = head_player;
	mov	rax, QWORD PTR -40[rbp]	# tmp95, head_player
	mov	QWORD PTR -24[rbp], rax	# next_player, tmp95
# worm.c:181:     while(next_player->child_player != NULL){
	jmp	.L43	#
.L44:
# worm.c:182:         Vector2 old_pos = next_player->old_position;
	mov	rax, QWORD PTR -24[rbp]	# tmp96, next_player
	mov	rax, QWORD PTR 32[rax]	# tmp97, next_player_12->old_position
	mov	QWORD PTR -16[rbp], rax	# old_pos, tmp97
# worm.c:183:         next_player = next_player->child_player;
	mov	rax, QWORD PTR -24[rbp]	# tmp98, next_player
	mov	rax, QWORD PTR 16[rax]	# tmp99, next_player_12->child_player
	mov	QWORD PTR -24[rbp], rax	# next_player, tmp99
# worm.c:184:         next_player->old_position = (Vector2){next_player->rect.x, next_player->rect.y};
	mov	rax, QWORD PTR -24[rbp]	# tmp100, next_player
	movss	xmm1, DWORD PTR [rax]	# _1, next_player_18->rect.x
# worm.c:184:         next_player->old_position = (Vector2){next_player->rect.x, next_player->rect.y};
	mov	rax, QWORD PTR -24[rbp]	# tmp101, next_player
	movss	xmm0, DWORD PTR 4[rax]	# _2, next_player_18->rect.y
# worm.c:184:         next_player->old_position = (Vector2){next_player->rect.x, next_player->rect.y};
	mov	rax, QWORD PTR -24[rbp]	# tmp102, next_player
	movss	DWORD PTR 32[rax], xmm1	# next_player_18->old_position.x, _1
	mov	rax, QWORD PTR -24[rbp]	# tmp103, next_player
	movss	DWORD PTR 36[rax], xmm0	# next_player_18->old_position.y, _2
# worm.c:187: 		Vector2 new_pos = old_pos;//Vector2Subtract(parent_pos, Vector2Scale(old_pos, 2.0)); 
	mov	rax, QWORD PTR -16[rbp]	# tmp104, old_pos
	mov	QWORD PTR -8[rbp], rax	# new_pos, tmp104
# worm.c:189: 		printf("%.5f, %.5f", new_pos.x, new_pos.y);
	movss	xmm0, DWORD PTR -4[rbp]	# _3, new_pos.y
# worm.c:189: 		printf("%.5f, %.5f", new_pos.x, new_pos.y);
	cvtss2sd	xmm0, xmm0	# _4, _3
# worm.c:189: 		printf("%.5f, %.5f", new_pos.x, new_pos.y);
	movss	xmm1, DWORD PTR -8[rbp]	# _5, new_pos.x
# worm.c:189: 		printf("%.5f, %.5f", new_pos.x, new_pos.y);
	pxor	xmm4, xmm4	# _6
	cvtss2sd	xmm4, xmm1	# _6, _5
	movq	rax, xmm4	# _6, _6
	movapd	xmm1, xmm0	#, _4
	movq	xmm0, rax	#, _6
	lea	rax, .LC9[rip]	# tmp105,
	mov	rdi, rax	#, tmp105
	mov	eax, 2	#,
	call	printf@PLT	#
# worm.c:191: 			new_pos.x,
	movss	xmm3, DWORD PTR -8[rbp]	# _7, new_pos.x
# worm.c:192: 			new_pos.y,
	movss	xmm2, DWORD PTR -4[rbp]	# _8, new_pos.y
# worm.c:193: 			next_player->rect.width,
	mov	rax, QWORD PTR -24[rbp]	# tmp106, next_player
	movss	xmm1, DWORD PTR 8[rax]	# _9, next_player_18->rect.width
# worm.c:194: 			next_player->rect.height
	mov	rax, QWORD PTR -24[rbp]	# tmp107, next_player
	movss	xmm0, DWORD PTR 12[rax]	# _10, next_player_18->rect.height
# worm.c:190: 		next_player->rect = (Rectangle){
	mov	rax, QWORD PTR -24[rbp]	# tmp108, next_player
	movss	DWORD PTR [rax], xmm3	# next_player_18->rect.x, _7
	mov	rax, QWORD PTR -24[rbp]	# tmp109, next_player
	movss	DWORD PTR 4[rax], xmm2	# next_player_18->rect.y, _8
	mov	rax, QWORD PTR -24[rbp]	# tmp110, next_player
	movss	DWORD PTR 8[rax], xmm1	# next_player_18->rect.width, _9
	mov	rax, QWORD PTR -24[rbp]	# tmp111, next_player
	movss	DWORD PTR 12[rax], xmm0	# next_player_18->rect.height, _10
.L43:
# worm.c:181:     while(next_player->child_player != NULL){
	mov	rax, QWORD PTR -24[rbp]	# tmp112, next_player
	mov	rax, QWORD PTR 16[rax]	# _11, next_player_12->child_player
# worm.c:181:     while(next_player->child_player != NULL){
	test	rax, rax	# _11
	jne	.L44	#,
# worm.c:197: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE152:
	.size	domino_positions, .-domino_positions
	.type	draw_player, @function
draw_player:
.LFB153:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# head_player, head_player
# worm.c:200: 	Player* next_player = head_player;
	mov	rax, QWORD PTR -24[rbp]	# tmp83, head_player
	mov	QWORD PTR -8[rbp], rax	# next_player, tmp83
# worm.c:201: 	DrawRectangleRec(next_player->rect, next_player->color);
	mov	rax, QWORD PTR -8[rbp]	# tmp84, next_player
	mov	edx, DWORD PTR 40[rax]	# tmp85, next_player_5->color
	mov	rax, QWORD PTR -8[rbp]	# tmp86, next_player
	mov	rcx, QWORD PTR [rax]	# tmp87, next_player_5->rect
	mov	rax, QWORD PTR 8[rax]	# tmp88, next_player_5->rect
	mov	edi, edx	#, tmp85
	movq	xmm0, rcx	#, tmp87
	movq	xmm1, rax	#, tmp88
	call	DrawRectangleRec@PLT	#
# worm.c:202: 	while(next_player->child_player != NULL){
	jmp	.L46	#
.L47:
# worm.c:203: 		next_player = next_player->child_player;
	mov	rax, QWORD PTR -8[rbp]	# tmp89, next_player
	mov	rax, QWORD PTR 16[rax]	# tmp90, next_player_2->child_player
	mov	QWORD PTR -8[rbp], rax	# next_player, tmp90
# worm.c:204: 		DrawRectangleRec(next_player->rect, next_player->color);
	mov	rax, QWORD PTR -8[rbp]	# tmp91, next_player
	mov	edx, DWORD PTR 40[rax]	# tmp92, next_player_8->color
	mov	rax, QWORD PTR -8[rbp]	# tmp93, next_player
	mov	rcx, QWORD PTR [rax]	# tmp94, next_player_8->rect
	mov	rax, QWORD PTR 8[rax]	# tmp95, next_player_8->rect
	mov	edi, edx	#, tmp92
	movq	xmm0, rcx	#, tmp94
	movq	xmm1, rax	#, tmp95
	call	DrawRectangleRec@PLT	#
.L46:
# worm.c:202: 	while(next_player->child_player != NULL){
	mov	rax, QWORD PTR -8[rbp]	# tmp96, next_player
	mov	rax, QWORD PTR 16[rax]	# _1, next_player_2->child_player
# worm.c:202: 	while(next_player->child_player != NULL){
	test	rax, rax	# _1
	jne	.L47	#,
# worm.c:206: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE153:
	.size	draw_player, .-draw_player
	.globl	count_players
	.type	count_players, @function
count_players:
.LFB154:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# p, p
# worm.c:209:     int i = 0;
	mov	DWORD PTR -12[rbp], 0	# i,
# worm.c:210:     Player* tmp_player = p;
	mov	rax, QWORD PTR -24[rbp]	# tmp85, p
	mov	QWORD PTR -8[rbp], rax	# tmp_player, tmp85
# worm.c:212:     while(tmp_player->child_player != NULL){
	jmp	.L49	#
.L50:
# worm.c:213:         tmp_player = tmp_player->child_player;
	mov	rax, QWORD PTR -8[rbp]	# tmp86, tmp_player
	mov	rax, QWORD PTR 16[rax]	# tmp87, tmp_player_3->child_player
	mov	QWORD PTR -8[rbp], rax	# tmp_player, tmp87
# worm.c:214:         i = i + 1;
	add	DWORD PTR -12[rbp], 1	# i,
.L49:
# worm.c:212:     while(tmp_player->child_player != NULL){
	mov	rax, QWORD PTR -8[rbp]	# tmp88, tmp_player
	mov	rax, QWORD PTR 16[rax]	# _1, tmp_player_3->child_player
# worm.c:212:     while(tmp_player->child_player != NULL){
	test	rax, rax	# _1
	jne	.L50	#,
# worm.c:217:     return i;
	mov	eax, DWORD PTR -12[rbp]	# _8, i
# worm.c:218: }
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE154:
	.size	count_players, .-count_players
	.section	.rodata
	.align 4
.LC1:
	.long	1112014848
	.align 4
.LC2:
	.long	1067450368
	.align 4
.LC3:
	.long	1106247680
	.align 4
.LC5:
	.long	1144782848
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
