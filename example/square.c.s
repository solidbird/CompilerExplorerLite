
square.c.bin:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 a2 2f 00 00    	push   QWORD PTR [rip+0x2fa2]        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 a3 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fa3]        # 3fd0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]

Disassembly of section .plt.got:

0000000000001030 <__cxa_finalize@plt>:
    1030:	f3 0f 1e fa          	endbr64 
    1034:	f2 ff 25 bd 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fbd]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    103b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001040 <_start>:
    1040:	f3 0f 1e fa          	endbr64 
    1044:	31 ed                	xor    ebp,ebp
    1046:	49 89 d1             	mov    r9,rdx
    1049:	5e                   	pop    rsi
    104a:	48 89 e2             	mov    rdx,rsp
    104d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1051:	50                   	push   rax
    1052:	54                   	push   rsp
    1053:	45 31 c0             	xor    r8d,r8d
    1056:	31 c9                	xor    ecx,ecx
    1058:	48 8d 3d 29 01 00 00 	lea    rdi,[rip+0x129]        # 1188 <main>
    105f:	ff 15 73 2f 00 00    	call   QWORD PTR [rip+0x2f73]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1065:	f4                   	hlt    
    1066:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    106d:	00 00 00 

0000000000001070 <deregister_tm_clones>:
    1070:	48 8d 3d 99 2f 00 00 	lea    rdi,[rip+0x2f99]        # 4010 <__TMC_END__>
    1077:	48 8d 05 92 2f 00 00 	lea    rax,[rip+0x2f92]        # 4010 <__TMC_END__>
    107e:	48 39 f8             	cmp    rax,rdi
    1081:	74 15                	je     1098 <deregister_tm_clones+0x28>
    1083:	48 8b 05 56 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f56]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    108a:	48 85 c0             	test   rax,rax
    108d:	74 09                	je     1098 <deregister_tm_clones+0x28>
    108f:	ff e0                	jmp    rax
    1091:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1098:	c3                   	ret    
    1099:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010a0 <register_tm_clones>:
    10a0:	48 8d 3d 69 2f 00 00 	lea    rdi,[rip+0x2f69]        # 4010 <__TMC_END__>
    10a7:	48 8d 35 62 2f 00 00 	lea    rsi,[rip+0x2f62]        # 4010 <__TMC_END__>
    10ae:	48 29 fe             	sub    rsi,rdi
    10b1:	48 89 f0             	mov    rax,rsi
    10b4:	48 c1 ee 3f          	shr    rsi,0x3f
    10b8:	48 c1 f8 03          	sar    rax,0x3
    10bc:	48 01 c6             	add    rsi,rax
    10bf:	48 d1 fe             	sar    rsi,1
    10c2:	74 14                	je     10d8 <register_tm_clones+0x38>
    10c4:	48 8b 05 25 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f25]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    10cb:	48 85 c0             	test   rax,rax
    10ce:	74 08                	je     10d8 <register_tm_clones+0x38>
    10d0:	ff e0                	jmp    rax
    10d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10d8:	c3                   	ret    
    10d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010e0 <__do_global_dtors_aux>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	80 3d 25 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f25],0x0        # 4010 <__TMC_END__>
    10eb:	75 2b                	jne    1118 <__do_global_dtors_aux+0x38>
    10ed:	55                   	push   rbp
    10ee:	48 83 3d 02 2f 00 00 	cmp    QWORD PTR [rip+0x2f02],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10f5:	00 
    10f6:	48 89 e5             	mov    rbp,rsp
    10f9:	74 0c                	je     1107 <__do_global_dtors_aux+0x27>
    10fb:	48 8b 3d 06 2f 00 00 	mov    rdi,QWORD PTR [rip+0x2f06]        # 4008 <__dso_handle>
    1102:	e8 29 ff ff ff       	call   1030 <__cxa_finalize@plt>
    1107:	e8 64 ff ff ff       	call   1070 <deregister_tm_clones>
    110c:	c6 05 fd 2e 00 00 01 	mov    BYTE PTR [rip+0x2efd],0x1        # 4010 <__TMC_END__>
    1113:	5d                   	pop    rbp
    1114:	c3                   	ret    
    1115:	0f 1f 00             	nop    DWORD PTR [rax]
    1118:	c3                   	ret    
    1119:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001120 <frame_dummy>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	e9 77 ff ff ff       	jmp    10a0 <register_tm_clones>

0000000000001129 <square>:
int square(int num) {
    1129:	f3 0f 1e fa          	endbr64 
    112d:	55                   	push   rbp
    112e:	48 89 e5             	mov    rbp,rsp
    1131:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
	return num * num;
    1134:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1137:	0f af c0             	imul   eax,eax
}
    113a:	5d                   	pop    rbp
    113b:	c3                   	ret    

000000000000113c <test>:

void test(int a, int b, int c){
    113c:	f3 0f 1e fa          	endbr64 
    1140:	55                   	push   rbp
    1141:	48 89 e5             	mov    rbp,rsp
    1144:	48 83 ec 20          	sub    rsp,0x20
    1148:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    114b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    114e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
	int tmp1 = a;
    1151:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    1154:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
	int tmp2 = c;
    1157:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    115a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	a = c;
    115d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    1160:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
	c = tmp1;
    1163:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    1166:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	b = b * b;
    1169:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    116c:	0f af c0             	imul   eax,eax
    116f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
	while(b == 2){
    1172:	eb 0a                	jmp    117e <test+0x42>
		square(b);
    1174:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    1177:	89 c7                	mov    edi,eax
    1179:	e8 ab ff ff ff       	call   1129 <square>
	while(b == 2){
    117e:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
    1182:	74 f0                	je     1174 <test+0x38>
	}
}
    1184:	90                   	nop
    1185:	90                   	nop
    1186:	c9                   	leave  
    1187:	c3                   	ret    

0000000000001188 <main>:

int main(){
    1188:	f3 0f 1e fa          	endbr64 
    118c:	55                   	push   rbp
    118d:	48 89 e5             	mov    rbp,rsp
	return 0;
    1190:	b8 00 00 00 00       	mov    eax,0x0
}
    1195:	5d                   	pop    rbp
    1196:	c3                   	ret    

Disassembly of section .fini:

0000000000001198 <_fini>:
    1198:	f3 0f 1e fa          	endbr64 
    119c:	48 83 ec 08          	sub    rsp,0x8
    11a0:	48 83 c4 08          	add    rsp,0x8
    11a4:	c3                   	ret    
