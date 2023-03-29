	.text
	.intel_syntax noprefix
	.file	"main.c"
	.globl	NextRand                        # -- Begin function NextRand
	.p2align	4, 0x90
	.type	NextRand,@function
NextRand:                               # @NextRand
	.cfi_startproc
# %bb.0:
	movabs	rcx, 6041729068120448059
	mov	rax, rdi
	imul	rcx
	mov	rcx, rdx
	shr	rcx, 63
	sar	rdx, 16
	add	rcx, rdx
	add	rcx, rdi
	mov	rax, rcx
	shl	rax, 25
	sub	rcx, rax
	lea	rax, [rcx + 134217727]
	test	rcx, rcx
	cmovns	rax, rcx
	sar	rax, 27
	add	rax, rcx
	movabs	rcx, 2685821657736338717
	imul	rcx, rax
	mov	edx, 4294967295
	add	rdx, rcx
	test	rcx, rcx
	cmovns	rdx, rcx
	sar	rdx, 32
	ret
.Lfunc_end0:
	.size	NextRand, .Lfunc_end0-NextRand
	.cfi_endproc
                                        # -- End function
	.globl	min                             # -- Begin function min
	.p2align	4, 0x90
	.type	min,@function
min:                                    # @min
	.cfi_startproc
# %bb.0:
	mov	eax, esi
	cmp	edi, esi
	cmovl	eax, edi
	ret
.Lfunc_end1:
	.size	min, .Lfunc_end1-min
	.cfi_endproc
                                        # -- End function
	.globl	max                             # -- Begin function max
	.p2align	4, 0x90
	.type	max,@function
max:                                    # @max
	.cfi_startproc
# %bb.0:
	mov	eax, esi
	cmp	edi, esi
	cmovg	eax, edi
	ret
.Lfunc_end2:
	.size	max, .Lfunc_end2-max
	.cfi_endproc
                                        # -- End function
	.globl	makeBoard                       # -- Begin function makeBoard
	.p2align	4, 0x90
	.type	makeBoard,@function
makeBoard:                              # @makeBoard
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r15, rdx
	mov	rbx, rsi
	mov	r12, rdi
	lea	rdi, [8*rsi]
	call	malloc@PLT
	test	rbx, rbx
	je	.LBB3_6
# %bb.1:
	test	r15, r15
	mov	qword ptr [rsp + 16], rbx       # 8-byte Spill
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	je	.LBB3_7
# %bb.2:
	xor	r13d, r13d
	movabs	rbp, 6041729068120448059
	movabs	rbx, 2685821657736338717
	mov	r14d, 4294967295
	.p2align	4, 0x90
.LBB3_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
	mov	rdi, r15
	call	malloc@PLT
	mov	rcx, rax
	xor	esi, esi
	.p2align	4, 0x90
.LBB3_4:                                #   Parent Loop BB3_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, r12
	imul	rbp
	mov	rax, rdx
	shr	rax, 63
	sar	rdx, 16
	add	rdx, rax
	add	rdx, r12
	mov	rax, rdx
	shl	rax, 25
	sub	rdx, rax
	lea	r12, [rdx + 134217727]
	test	rdx, rdx
	cmovns	r12, rdx
	sar	r12, 27
	add	r12, rdx
	mov	rax, r12
	imul	rax, rbx
	lea	rdx, [rax + r14]
	test	rax, rax
	cmovns	rdx, rax
	bt	rdx, 32
	setae	byte ptr [rcx + rsi]
	inc	rsi
	cmp	r15, rsi
	jne	.LBB3_4
# %bb.5:                                #   in Loop: Header=BB3_3 Depth=1
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mov	qword ptr [rax + 8*r13], rcx
	inc	r13
	cmp	r13, qword ptr [rsp + 16]       # 8-byte Folded Reload
	jne	.LBB3_3
	jmp	.LBB3_6
.LBB3_7:
	xor	ebx, ebx
	.p2align	4, 0x90
.LBB3_8:                                # =>This Inner Loop Header: Depth=1
	xor	edi, edi
	call	malloc@PLT
	mov	rcx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	qword ptr [rcx + 8*rbx], rax
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	inc	rbx
	cmp	qword ptr [rsp + 16], rbx       # 8-byte Folded Reload
	jne	.LBB3_8
.LBB3_6:
	add	rsp, 24
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end3:
	.size	makeBoard, .Lfunc_end3-makeBoard
	.cfi_endproc
                                        # -- End function
	.globl	lookup                          # -- Begin function lookup
	.p2align	4, 0x90
	.type	lookup,@function
lookup:                                 # @lookup
	.cfi_startproc
# %bb.0:
	mov	rax, qword ptr [rdi + 8*rcx]
	movzx	eax, byte ptr [rax + r8]
	ret
.Lfunc_end4:
	.size	lookup, .Lfunc_end4-lookup
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function cellularAutomata
.LCPI5_0:
	.quad	1                               # 0x1
	.quad	1                               # 0x1
	.text
	.globl	cellularAutomata
	.p2align	4, 0x90
	.type	cellularAutomata,@function
cellularAutomata:                       # @cellularAutomata
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 88
	.cfi_def_cfa_offset 144
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r14, rdx
	mov	rbx, rsi
	mov	r12, rdi
	lea	rdi, [8*rsi]
	call	malloc@PLT
	test	rbx, rbx
	je	.LBB5_32
# %bb.1:
	test	r14, r14
	mov	qword ptr [rsp + 40], rbx       # 8-byte Spill
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	je	.LBB5_33
# %bb.2:
	lea	eax, [rbx - 1]
	mov	dword ptr [rsp + 20], eax       # 4-byte Spill
	lea	ebp, [r14 - 1]
	mov	ecx, -1
	xor	r15d, r15d
	mov	qword ptr [rsp + 48], r14       # 8-byte Spill
	mov	dword ptr [rsp + 4], ebp        # 4-byte Spill
	jmp	.LBB5_3
	.p2align	4, 0x90
.LBB5_30:                               #   in Loop: Header=BB5_3 Depth=1
	mov	rdi, r13
	xor	esi, esi
	mov	rdx, r14
	call	memset@PLT
.LBB5_31:                               #   in Loop: Header=BB5_3 Depth=1
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mov	qword ptr [rax + 8*r15], r13
	inc	r15
	mov	ecx, dword ptr [rsp + 24]       # 4-byte Reload
	inc	ecx
	cmp	r15, qword ptr [rsp + 40]       # 8-byte Folded Reload
	je	.LBB5_32
.LBB5_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_23 Depth 4
                                        #         Child Loop BB5_26 Depth 4
                                        #         Child Loop BB5_12 Depth 4
	test	ecx, ecx
	mov	eax, 0
	mov	dword ptr [rsp + 24], ecx       # 4-byte Spill
	cmovg	eax, ecx
	mov	qword ptr [rsp + 64], rax       # 8-byte Spill
	mov	rdi, r14
	call	malloc@PLT
	mov	r13, rax
	lea	ecx, [r15 - 1]
	test	ecx, ecx
	mov	eax, 0
	cmovle	ecx, eax
	lea	eax, [r15 + 1]
	mov	edx, dword ptr [rsp + 20]       # 4-byte Reload
	cmp	edx, eax
	cmovl	eax, edx
	cmp	ecx, eax
	jg	.LBB5_30
# %bb.4:                                #   in Loop: Header=BB5_3 Depth=1
	cdqe
	mov	edx, -1
	mov	r8d, 1
	xor	esi, esi
	pxor	xmm4, xmm4
	pcmpeqd	xmm5, xmm5
	movdqa	xmm6, xmmword ptr [rip + .LCPI5_0] # xmm6 = [1,1]
	mov	r9, r15
	mov	qword ptr [rsp + 56], r13       # 8-byte Spill
	jmp	.LBB5_5
	.p2align	4, 0x90
.LBB5_29:                               #   in Loop: Header=BB5_5 Depth=2
	xor	ecx, ecx
	mov	r14, qword ptr [rsp + 48]       # 8-byte Reload
	mov	ebp, dword ptr [rsp + 4]        # 4-byte Reload
	mov	r13, qword ptr [rsp + 56]       # 8-byte Reload
.LBB5_19:                               #   in Loop: Header=BB5_5 Depth=2
	mov	byte ptr [r13 + rsi], cl
	inc	rsi
	mov	edx, dword ptr [rsp + 32]       # 4-byte Reload
	inc	edx
	mov	r8d, dword ptr [rsp + 28]       # 4-byte Reload
	inc	r8d
	cmp	rsi, r14
	je	.LBB5_31
.LBB5_5:                                #   Parent Loop BB5_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_23 Depth 4
                                        #         Child Loop BB5_26 Depth 4
                                        #         Child Loop BB5_12 Depth 4
	xor	ecx, ecx
	test	edx, edx
	mov	edi, 0
	mov	dword ptr [rsp + 32], edx       # 4-byte Spill
	cmovg	edi, edx
	cmp	r8d, ebp
	mov	edx, ebp
	mov	dword ptr [rsp + 28], r8d       # 4-byte Spill
	cmovl	edx, r8d
	movsxd	r8, edx
	cmp	r8, rdi
	cmovle	r8, rdi
	lea	edx, [rsi + 1]
	cmp	edx, ebp
	cmovge	edx, ebp
	mov	dword ptr [rsp + 36], edx       # 4-byte Spill
	movsxd	r10, edx
	cmp	r10, rdi
	mov	r11, rdi
	cmovg	r11, r10
	lea	edx, [rsi - 1]
	test	edx, edx
	cmovle	edx, ecx
	cmp	r10, rdx
	mov	rbx, rdx
	cmovg	rbx, r10
	cmp	edx, r10d
	jg	.LBB5_19
# %bb.6:                                #   in Loop: Header=BB5_5 Depth=2
	sub	r8, rdi
	inc	r8
	and	r8, -4
	sub	r11, rdi
	inc	r11
	sub	rbx, rdx
	inc	rbx
	mov	rcx, rbx
	and	rcx, -4
	mov	qword ptr [rsp + 80], rcx       # 8-byte Spill
	add	rcx, rdi
	mov	qword ptr [rsp + 72], rcx       # 8-byte Spill
	lea	r14, [rdi + 1]
	mov	r13, qword ptr [rsp + 64]       # 8-byte Reload
	xor	ecx, ecx
	jmp	.LBB5_7
	.p2align	4, 0x90
.LBB5_27:                               #   in Loop: Header=BB5_7 Depth=3
	lea	rdx, [r13 + 1]
	cmp	r13, rax
	mov	r13, rdx
	mov	r15, r9
	jge	.LBB5_28
.LBB5_7:                                #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_23 Depth 4
                                        #         Child Loop BB5_26 Depth 4
                                        #         Child Loop BB5_12 Depth 4
	cmp	r15, r13
	jne	.LBB5_20
# %bb.8:                                #   in Loop: Header=BB5_7 Depth=3
	mov	rdx, r14
	test	r11b, 1
	cmove	rdx, rdi
	je	.LBB5_11
# %bb.9:                                #   in Loop: Header=BB5_7 Depth=3
	cmp	rsi, rdi
	je	.LBB5_11
# %bb.10:                               #   in Loop: Header=BB5_7 Depth=3
	mov	rdx, qword ptr [r12 + 8*r13]
	cmp	byte ptr [rdx + rdi], 1
	sbb	rcx, -1
	mov	rdx, r14
.LBB5_11:                               #   in Loop: Header=BB5_7 Depth=3
	cmp	edi, dword ptr [rsp + 36]       # 4-byte Folded Reload
	jl	.LBB5_12
	jmp	.LBB5_27
	.p2align	4, 0x90
.LBB5_16:                               #   in Loop: Header=BB5_12 Depth=4
	lea	rdx, [r15 + 1]
	cmp	r15, r10
	jge	.LBB5_27
.LBB5_12:                               #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	cmp	rsi, rdx
	jne	.LBB5_13
# %bb.14:                               #   in Loop: Header=BB5_12 Depth=4
	lea	r15, [rdx + 1]
	cmp	rsi, r15
	je	.LBB5_16
	jmp	.LBB5_15
	.p2align	4, 0x90
.LBB5_13:                               #   in Loop: Header=BB5_12 Depth=4
	mov	r15, qword ptr [r12 + 8*r13]
	cmp	byte ptr [r15 + rdx], 1
	sbb	rcx, -1
	lea	r15, [rdx + 1]
	cmp	rsi, r15
	je	.LBB5_16
.LBB5_15:                               #   in Loop: Header=BB5_12 Depth=4
	mov	rbp, qword ptr [r12 + 8*r13]
	cmp	byte ptr [rbp + rdx + 1], 1
	sbb	rcx, -1
	jmp	.LBB5_16
	.p2align	4, 0x90
.LBB5_20:                               #   in Loop: Header=BB5_7 Depth=3
	mov	rdx, qword ptr [r12 + 8*r13]
	cmp	rbx, 4
	jae	.LBB5_22
# %bb.21:                               #   in Loop: Header=BB5_7 Depth=3
	mov	r15, rdi
	jmp	.LBB5_25
	.p2align	4, 0x90
.LBB5_22:                               #   in Loop: Header=BB5_7 Depth=3
	movq	xmm1, rcx
	lea	rcx, [rdx + rdi]
	add	rcx, 2
	pxor	xmm0, xmm0
	xor	r15d, r15d
	.p2align	4, 0x90
.LBB5_23:                               #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movzx	ebp, word ptr [rcx + r15 - 2]
	movd	xmm2, ebp
	movzx	ebp, word ptr [rcx + r15]
	movd	xmm3, ebp
	pcmpeqb	xmm2, xmm4
	pxor	xmm2, xmm5
	punpcklbw	xmm2, xmm2              # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	pshuflw	xmm2, xmm2, 212                 # xmm2 = xmm2[0,1,1,3,4,5,6,7]
	pshufd	xmm2, xmm2, 212                 # xmm2 = xmm2[0,1,1,3]
	pand	xmm2, xmm6
	paddq	xmm1, xmm2
	pcmpeqb	xmm3, xmm4
	pxor	xmm3, xmm5
	punpcklbw	xmm3, xmm3              # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	pshuflw	xmm2, xmm3, 212                 # xmm2 = xmm3[0,1,1,3,4,5,6,7]
	pshufd	xmm2, xmm2, 212                 # xmm2 = xmm2[0,1,1,3]
	pand	xmm2, xmm6
	paddq	xmm0, xmm2
	add	r15, 4
	cmp	r8, r15
	jne	.LBB5_23
# %bb.24:                               #   in Loop: Header=BB5_7 Depth=3
	paddq	xmm0, xmm1
	pshufd	xmm1, xmm0, 238                 # xmm1 = xmm0[2,3,2,3]
	paddq	xmm1, xmm0
	movq	rcx, xmm1
	mov	r15, qword ptr [rsp + 72]       # 8-byte Reload
	cmp	rbx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	je	.LBB5_27
.LBB5_25:                               #   in Loop: Header=BB5_7 Depth=3
	dec	r15
	.p2align	4, 0x90
.LBB5_26:                               #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	cmp	byte ptr [rdx + r15 + 1], 1
	sbb	rcx, -1
	inc	r15
	cmp	r15, r10
	jl	.LBB5_26
	jmp	.LBB5_27
	.p2align	4, 0x90
.LBB5_28:                               #   in Loop: Header=BB5_5 Depth=2
	cmp	rcx, 4
	jb	.LBB5_29
# %bb.17:                               #   in Loop: Header=BB5_5 Depth=2
	mov	cl, 1
	mov	r14, qword ptr [rsp + 48]       # 8-byte Reload
	mov	ebp, dword ptr [rsp + 4]        # 4-byte Reload
	mov	r13, qword ptr [rsp + 56]       # 8-byte Reload
	jne	.LBB5_19
# %bb.18:                               #   in Loop: Header=BB5_5 Depth=2
	mov	rcx, qword ptr [r12 + 8*r15]
	movzx	ecx, byte ptr [rcx + rsi]
	jmp	.LBB5_19
.LBB5_33:
	xor	ebx, ebx
	.p2align	4, 0x90
.LBB5_34:                               # =>This Inner Loop Header: Depth=1
	xor	edi, edi
	call	malloc@PLT
	mov	rcx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	qword ptr [rcx + 8*rbx], rax
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	inc	rbx
	cmp	qword ptr [rsp + 40], rbx       # 8-byte Folded Reload
	jne	.LBB5_34
.LBB5_32:
	add	rsp, 88
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end5:
	.size	cellularAutomata, .Lfunc_end5-cellularAutomata
	.cfi_endproc
                                        # -- End function
	.globl	display                         # -- Begin function display
	.p2align	4, 0x90
	.type	display,@function
display:                                # @display
	.cfi_startproc
# %bb.0:
	push	r15
	.cfi_def_cfa_offset 16
	push	r14
	.cfi_def_cfa_offset 24
	push	r13
	.cfi_def_cfa_offset 32
	push	r12
	.cfi_def_cfa_offset 40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r13, -32
	.cfi_offset r14, -24
	.cfi_offset r15, -16
	test	rsi, rsi
	je	.LBB6_9
# %bb.1:
	mov	r14, rdx
	mov	rbx, rsi
	test	rdx, rdx
	je	.LBB6_8
# %bb.2:
	mov	r15, rdi
	xor	r12d, r12d
	jmp	.LBB6_3
	.p2align	4, 0x90
.LBB6_7:                                #   in Loop: Header=BB6_3 Depth=1
	mov	edi, 10
	call	putchar@PLT
	inc	r12
	cmp	r12, rbx
	je	.LBB6_9
.LBB6_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_4 Depth 2
	xor	r13d, r13d
	jmp	.LBB6_4
	.p2align	4, 0x90
.LBB6_6:                                #   in Loop: Header=BB6_4 Depth=2
	call	putchar@PLT
	inc	r13
	cmp	r14, r13
	je	.LBB6_7
.LBB6_4:                                #   Parent Loop BB6_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, qword ptr [r15 + 8*r12]
	cmp	byte ptr [rax + r13], 0
	mov	edi, 46
	je	.LBB6_6
# %bb.5:                                #   in Loop: Header=BB6_4 Depth=2
	mov	edi, 35
	jmp	.LBB6_6
	.p2align	4, 0x90
.LBB6_8:                                # =>This Inner Loop Header: Depth=1
	mov	edi, 10
	call	putchar@PLT
	dec	rbx
	jne	.LBB6_8
.LBB6_9:
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end6:
	.size	display, .Lfunc_end6-display
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r13, rsi
	cmp	edi, 3
	jle	.LBB7_31
# %bb.1:
	mov	rdi, qword ptr [r13 + 8]
	xor	esi, esi
	mov	edx, 10
	call	strtol@PLT
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mov	rdi, qword ptr [r13 + 16]
	xor	esi, esi
	mov	edx, 10
	call	strtol@PLT
	movsxd	rbp, eax
	mov	rbx, rax
	shl	rbx, 32
	mov	rdi, qword ptr [r13 + 24]
	xor	esi, esi
	mov	edx, 10
	call	strtol@PLT
	movsxd	r14, eax
	mov	r12, rax
	shl	r12, 32
	mov	rdi, rbx
	sar	rdi, 29
	call	malloc@PLT
	mov	r15, rax
	mov	qword ptr [rsp + 8], rbx        # 8-byte Spill
	test	rbx, rbx
	mov	qword ptr [rsp + 48], r13       # 8-byte Spill
	mov	qword ptr [rsp + 40], r12       # 8-byte Spill
	je	.LBB7_2
# %bb.11:
	mov	qword ptr [rsp + 16], r15       # 8-byte Spill
	mov	qword ptr [rsp + 24], rbp       # 8-byte Spill
	test	r12, r12
	je	.LBB7_12
# %bb.14:
	movsxd	r13, dword ptr [rsp + 32]       # 4-byte Folded Reload
	xor	r15d, r15d
	movabs	rbp, 6041729068120448059
	movabs	rbx, 2685821657736338717
	mov	r12d, 4294967295
	.p2align	4, 0x90
.LBB7_15:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_16 Depth 2
	mov	rdi, r14
	call	malloc@PLT
	mov	rcx, rax
	xor	esi, esi
	.p2align	4, 0x90
.LBB7_16:                               #   Parent Loop BB7_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, r13
	imul	rbp
	mov	rax, rdx
	shr	rax, 63
	sar	rdx, 16
	add	rdx, rax
	add	rdx, r13
	mov	rax, rdx
	shl	rax, 25
	sub	rdx, rax
	lea	r13, [rdx + 134217727]
	test	rdx, rdx
	cmovns	r13, rdx
	sar	r13, 27
	add	r13, rdx
	mov	rax, r13
	imul	rax, rbx
	lea	rdx, [rax + r12]
	test	rax, rax
	cmovns	rdx, rax
	bt	rdx, 32
	setae	byte ptr [rcx + rsi]
	inc	rsi
	cmp	r14, rsi
	jne	.LBB7_16
# %bb.17:                               #   in Loop: Header=BB7_15 Depth=1
	mov	rdx, qword ptr [rsp + 16]       # 8-byte Reload
	mov	qword ptr [rdx + 8*r15], rcx
	inc	r15
	mov	rcx, qword ptr [rsp + 24]       # 8-byte Reload
	cmp	r15, rcx
	jne	.LBB7_15
	jmp	.LBB7_18
.LBB7_2:
	mov	rdi, r15
	mov	rsi, rbp
	mov	rdx, r14
	call	cellularAutomata
	mov	r13, rax
	mov	r12, r15
	jmp	.LBB7_3
.LBB7_12:
	xor	ebx, ebx
	mov	rcx, qword ptr [rsp + 24]       # 8-byte Reload
	mov	rdx, qword ptr [rsp + 16]       # 8-byte Reload
	.p2align	4, 0x90
.LBB7_13:                               # =>This Inner Loop Header: Depth=1
	mov	r15, rdx
	xor	edi, edi
	mov	r12, rcx
	call	malloc@PLT
	mov	rcx, r12
	mov	rdx, r15
	mov	qword ptr [r15 + 8*rbx], rax
	inc	rbx
	cmp	r12, rbx
	jne	.LBB7_13
.LBB7_18:
	mov	r12, rdx
	mov	rdi, rdx
	mov	rbp, rcx
	mov	rsi, rcx
	mov	rdx, r14
	call	cellularAutomata
	mov	r13, rax
	cmp	qword ptr [rsp + 8], 0          # 8-byte Folded Reload
	je	.LBB7_3
# %bb.19:
	cmp	rbp, 2
	mov	ebx, 1
	cmovae	rbx, rbp
	xor	r15d, r15d
	.p2align	4, 0x90
.LBB7_20:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [r12 + 8*r15]
	call	free@PLT
	inc	r15
	cmp	rbx, r15
	jne	.LBB7_20
.LBB7_3:
	mov	rdi, r12
	call	free@PLT
	mov	rdi, r13
	mov	rsi, rbp
	mov	rdx, r14
	call	cellularAutomata
	mov	r12, rax
	cmp	qword ptr [rsp + 8], 0          # 8-byte Folded Reload
	je	.LBB7_6
# %bb.4:
	cmp	rbp, 2
	mov	ebx, 1
	cmovae	rbx, rbp
	xor	r15d, r15d
	.p2align	4, 0x90
.LBB7_5:                                # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [r13 + 8*r15]
	call	free@PLT
	inc	r15
	cmp	rbx, r15
	jne	.LBB7_5
.LBB7_6:
	mov	rdi, r13
	call	free@PLT
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mov	rdi, qword ptr [rax + 32]
	lea	rsi, [rip + .L.str.5]
	mov	edx, 4
	call	strncmp@PLT
	cmp	qword ptr [rsp + 8], 0          # 8-byte Folded Reload
	je	.LBB7_27
# %bb.7:
	test	eax, eax
	jne	.LBB7_27
# %bb.8:
	cmp	qword ptr [rsp + 40], 0         # 8-byte Folded Reload
	je	.LBB7_9
# %bb.21:
	xor	ebx, ebx
	jmp	.LBB7_22
	.p2align	4, 0x90
.LBB7_26:                               #   in Loop: Header=BB7_22 Depth=1
	mov	edi, 10
	call	putchar@PLT
	inc	rbx
	cmp	rbx, rbp
	je	.LBB7_27
.LBB7_22:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_23 Depth 2
	mov	r15, qword ptr [r12 + 8*rbx]
	xor	r13d, r13d
	jmp	.LBB7_23
	.p2align	4, 0x90
.LBB7_25:                               #   in Loop: Header=BB7_23 Depth=2
	call	putchar@PLT
	inc	r13
	cmp	r14, r13
	je	.LBB7_26
.LBB7_23:                               #   Parent Loop BB7_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmp	byte ptr [r15 + r13], 0
	mov	edi, 46
	je	.LBB7_25
# %bb.24:                               #   in Loop: Header=BB7_23 Depth=2
	mov	edi, 35
	jmp	.LBB7_25
.LBB7_9:
	mov	rbx, rbp
	.p2align	4, 0x90
.LBB7_10:                               # =>This Inner Loop Header: Depth=1
	mov	edi, 10
	call	putchar@PLT
	dec	rbx
	jne	.LBB7_10
.LBB7_27:
	cmp	qword ptr [rsp + 8], 0          # 8-byte Folded Reload
	je	.LBB7_30
# %bb.28:
	cmp	rbp, 2
	mov	ebx, 1
	cmovae	rbx, rbp
	xor	r14d, r14d
	.p2align	4, 0x90
.LBB7_29:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [r12 + 8*r14]
	call	free@PLT
	inc	r14
	cmp	rbx, r14
	jne	.LBB7_29
.LBB7_30:
	mov	rdi, r12
	call	free@PLT
	xor	eax, eax
	add	rsp, 56
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB7_31:
	.cfi_def_cfa_offset 112
	mov	rbx, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rbx]
	mov	rdx, qword ptr [r13]
	lea	rsi, [rip + .L.str.3]
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbx]
	mov	rdx, qword ptr [r13]
	lea	rsi, [rip + .L.str.4]
	xor	eax, eax
	call	fprintf@PLT
	mov	edi, 1
	call	exit@PLT
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str.3,@object                # @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"Usage: %s [seed:int] [numRows:int] [numCols:int] [display:bool]\n"
	.size	.L.str.3, 65

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Example: %s 1337 20 80 true\n"
	.size	.L.str.4, 29

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"true"
	.size	.L.str.5, 5

	.ident	"clang version 16.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
