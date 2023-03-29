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
	mov	rbx, rdx
	mov	r14, rsi
	mov	r12, rdi
	lea	rdi, [8*rsi]
	call	malloc@PLT
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	qword ptr [rsp + 16], r14       # 8-byte Spill
	test	r14, r14
	je	.LBB3_6
# %bb.1:
	xor	r13d, r13d
	movabs	rbp, 6041729068120448059
	movabs	r14, 2685821657736338717
	mov	r15d, 4294967295
	jmp	.LBB3_2
	.p2align	4, 0x90
.LBB3_5:                                #   in Loop: Header=BB3_2 Depth=1
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mov	qword ptr [rax + 8*r13], rcx
	inc	r13
	cmp	r13, qword ptr [rsp + 16]       # 8-byte Folded Reload
	je	.LBB3_6
.LBB3_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
	mov	rdi, rbx
	call	malloc@PLT
	mov	rcx, rax
	test	rbx, rbx
	je	.LBB3_5
# %bb.3:                                #   in Loop: Header=BB3_2 Depth=1
	xor	esi, esi
	.p2align	4, 0x90
.LBB3_4:                                #   Parent Loop BB3_2 Depth=1
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
	imul	rax, r14
	lea	rdx, [rax + r15]
	test	rax, rax
	cmovns	rdx, rax
	bt	rdx, 32
	setae	byte ptr [rcx + rsi]
	inc	rsi
	cmp	rbx, rsi
	jne	.LBB3_4
	jmp	.LBB3_5
.LBB3_6:
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
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
	.globl	cellularAutomata                # -- Begin function cellularAutomata
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
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rbx, rdx
	mov	r14, rsi
	mov	r15, rdi
	lea	rdi, [8*rsi]
	call	malloc@PLT
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mov	qword ptr [rsp + 24], r14       # 8-byte Spill
	test	r14, r14
	je	.LBB5_11
# %bb.1:
	mov	rax, qword ptr [rsp + 24]       # 8-byte Reload
	dec	eax
	mov	dword ptr [rsp + 12], eax       # 4-byte Spill
	lea	eax, [rbx - 1]
	mov	dword ptr [rsp + 20], eax       # 4-byte Spill
	mov	eax, -1
	xor	ebp, ebp
	jmp	.LBB5_2
	.p2align	4, 0x90
.LBB5_10:                               #   in Loop: Header=BB5_2 Depth=1
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	mov	qword ptr [rax + 8*rbp], rdx
	inc	rbp
	mov	eax, dword ptr [rsp + 16]       # 4-byte Reload
	inc	eax
	cmp	rbp, qword ptr [rsp + 24]       # 8-byte Folded Reload
	je	.LBB5_11
.LBB5_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_12 Depth 4
	test	eax, eax
	mov	ecx, 0
	mov	dword ptr [rsp + 16], eax       # 4-byte Spill
	cmovg	ecx, eax
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	rdi, rbx
	call	malloc@PLT
	mov	rdx, rax
	test	rbx, rbx
	je	.LBB5_10
# %bb.3:                                #   in Loop: Header=BB5_2 Depth=1
	lea	r11d, [rbp - 1]
	test	r11d, r11d
	mov	eax, 0
	cmovle	r11d, eax
	lea	r14d, [rbp + 1]
	mov	eax, dword ptr [rsp + 12]       # 4-byte Reload
	cmp	eax, r14d
	cmovl	r14d, eax
	movsxd	rsi, r14d
	mov	edi, -1
	xor	r8d, r8d
	xor	r9d, r9d
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	dword ptr [rsp + 8], r11d       # 4-byte Spill
	mov	dword ptr [rsp + 4], r14d       # 4-byte Spill
	jmp	.LBB5_4
	.p2align	4, 0x90
.LBB5_9:                                #   in Loop: Header=BB5_4 Depth=2
	xor	r10d, r10d
	mov	rbx, rdx
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mov	r11d, dword ptr [rsp + 8]       # 4-byte Reload
	mov	r14d, dword ptr [rsp + 4]       # 4-byte Reload
.LBB5_18:                               #   in Loop: Header=BB5_4 Depth=2
	mov	byte ptr [rdx + r9], r10b
	inc	r9
	inc	edi
	dec	r8
	cmp	r9, rbx
	je	.LBB5_10
.LBB5_4:                                #   Parent Loop BB5_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_12 Depth 4
	xor	r10d, r10d
	test	edi, edi
	mov	ecx, 0
	cmovg	ecx, edi
	cmp	r11d, r14d
	jg	.LBB5_18
# %bb.5:                                #   in Loop: Header=BB5_4 Depth=2
	mov	rdx, rbx
	dec	rcx
	lea	r11d, [r9 - 1]
	test	r11d, r11d
	mov	eax, 0
	cmovle	r11d, eax
	lea	r12d, [r9 + 1]
	mov	eax, dword ptr [rsp + 20]       # 4-byte Reload
	cmp	eax, r12d
	cmovl	r12d, eax
	movsxd	r14, r12d
	mov	rbx, qword ptr [rsp + 48]       # 8-byte Reload
	xor	r13d, r13d
	jmp	.LBB5_6
	.p2align	4, 0x90
.LBB5_7:                                #   in Loop: Header=BB5_6 Depth=3
	lea	r10, [rbx + 1]
	cmp	rbx, rsi
	mov	rbx, r10
	jge	.LBB5_8
.LBB5_6:                                #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_12 Depth 4
	mov	r10, rcx
	cmp	r11d, r12d
	jle	.LBB5_12
	jmp	.LBB5_7
	.p2align	4, 0x90
.LBB5_14:                               #   in Loop: Header=BB5_12 Depth=4
	mov	rax, qword ptr [r15 + 8*rbx]
	cmp	byte ptr [rax + r10 + 1], 1
	sbb	r13, -1
.LBB5_15:                               #   in Loop: Header=BB5_12 Depth=4
	inc	r10
	cmp	r10, r14
	jge	.LBB5_7
.LBB5_12:                               #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	cmp	rbp, rbx
	jne	.LBB5_14
# %bb.13:                               #   in Loop: Header=BB5_12 Depth=4
	lea	rax, [r8 + r10]
	cmp	rax, -1
	je	.LBB5_15
	jmp	.LBB5_14
	.p2align	4, 0x90
.LBB5_8:                                #   in Loop: Header=BB5_4 Depth=2
	cmp	r13, 4
	jb	.LBB5_9
# %bb.16:                               #   in Loop: Header=BB5_4 Depth=2
	mov	r10b, 1
	mov	rbx, rdx
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mov	r11d, dword ptr [rsp + 8]       # 4-byte Reload
	mov	r14d, dword ptr [rsp + 4]       # 4-byte Reload
	jne	.LBB5_18
# %bb.17:                               #   in Loop: Header=BB5_4 Depth=2
	mov	rax, qword ptr [r15 + 8*rbp]
	movzx	r10d, byte ptr [rax + r9]
	jmp	.LBB5_18
.LBB5_11:
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
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
	je	.LBB6_8
# %bb.1:
	mov	rbx, rdx
	mov	r14, rsi
	mov	r15, rdi
	xor	r12d, r12d
	jmp	.LBB6_2
	.p2align	4, 0x90
.LBB6_7:                                #   in Loop: Header=BB6_2 Depth=1
	mov	edi, 10
	call	putchar@PLT
	inc	r12
	cmp	r12, r14
	je	.LBB6_8
.LBB6_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_4 Depth 2
	test	rbx, rbx
	je	.LBB6_7
# %bb.3:                                #   in Loop: Header=BB6_2 Depth=1
	xor	r13d, r13d
	jmp	.LBB6_4
	.p2align	4, 0x90
.LBB6_6:                                #   in Loop: Header=BB6_4 Depth=2
	call	putchar@PLT
	inc	r13
	cmp	rbx, r13
	je	.LBB6_7
.LBB6_4:                                #   Parent Loop BB6_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, qword ptr [r15 + 8*r12]
	cmp	byte ptr [rax + r13], 0
	mov	edi, 46
	je	.LBB6_6
# %bb.5:                                #   in Loop: Header=BB6_4 Depth=2
	mov	edi, 35
	jmp	.LBB6_6
.LBB6_8:
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
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r15, rsi
	cmp	edi, 3
	jle	.LBB7_27
# %bb.1:
	mov	rdi, qword ptr [r15 + 8]
	xor	esi, esi
	mov	edx, 10
	call	strtol@PLT
	mov	r13, rax
	mov	rdi, qword ptr [r15 + 16]
	xor	esi, esi
	mov	edx, 10
	call	strtol@PLT
	movsxd	rbp, eax
	mov	rbx, rax
	shl	rbx, 32
	mov	rdi, qword ptr [r15 + 24]
	xor	esi, esi
	mov	edx, 10
	call	strtol@PLT
	movsxd	r14, eax
	shl	rax, 32
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rdi, rbx
	sar	rdi, 29
	call	malloc@PLT
	mov	r12, rax
	mov	qword ptr [rsp], rbx            # 8-byte Spill
	test	rbx, rbx
	mov	qword ptr [rsp + 32], r15       # 8-byte Spill
	je	.LBB7_2
# %bb.19:
	mov	qword ptr [rsp + 8], r12        # 8-byte Spill
	mov	qword ptr [rsp + 16], rbp       # 8-byte Spill
	movsxd	r13, r13d
	xor	ebp, ebp
	movabs	r15, 6041729068120448059
	movabs	rbx, 2685821657736338717
	mov	r12d, 4294967295
	jmp	.LBB7_20
	.p2align	4, 0x90
.LBB7_23:                               #   in Loop: Header=BB7_20 Depth=1
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mov	qword ptr [rax + 8*rbp], rcx
	inc	rbp
	cmp	rbp, qword ptr [rsp + 16]       # 8-byte Folded Reload
	je	.LBB7_24
.LBB7_20:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_22 Depth 2
	mov	rdi, r14
	call	malloc@PLT
	mov	rcx, rax
	cmp	qword ptr [rsp + 24], 0         # 8-byte Folded Reload
	je	.LBB7_23
# %bb.21:                               #   in Loop: Header=BB7_20 Depth=1
	xor	esi, esi
	.p2align	4, 0x90
.LBB7_22:                               #   Parent Loop BB7_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, r13
	imul	r15
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
	jne	.LBB7_22
	jmp	.LBB7_23
.LBB7_24:
	mov	r12, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rdi, r12
	mov	rbp, qword ptr [rsp + 16]       # 8-byte Reload
	mov	rsi, rbp
	mov	rdx, r14
	call	cellularAutomata
	mov	r13, rax
	cmp	qword ptr [rsp], 0              # 8-byte Folded Reload
	je	.LBB7_3
# %bb.25:
	cmp	rbp, 2
	mov	ebx, 1
	cmovae	rbx, rbp
	xor	r15d, r15d
	.p2align	4, 0x90
.LBB7_26:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [r12 + 8*r15]
	call	free@PLT
	inc	r15
	cmp	rbx, r15
	jne	.LBB7_26
	jmp	.LBB7_3
.LBB7_2:
	mov	rdi, r12
	mov	rsi, rbp
	mov	rdx, r14
	call	cellularAutomata
	mov	r13, rax
.LBB7_3:
	mov	rdi, r12
	call	free@PLT
	mov	rdi, r13
	mov	rsi, rbp
	mov	rdx, r14
	call	cellularAutomata
	mov	r12, rax
	cmp	qword ptr [rsp], 0              # 8-byte Folded Reload
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
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	mov	rdi, qword ptr [rax + 32]
	lea	rsi, [rip + .L.str.5]
	mov	edx, 4
	call	strncmp@PLT
	cmp	qword ptr [rsp], 0              # 8-byte Folded Reload
	je	.LBB7_15
# %bb.7:
	test	eax, eax
	jne	.LBB7_15
# %bb.8:
	xor	ebx, ebx
	jmp	.LBB7_9
	.p2align	4, 0x90
.LBB7_14:                               #   in Loop: Header=BB7_9 Depth=1
	mov	edi, 10
	call	putchar@PLT
	inc	rbx
	cmp	rbx, rbp
	je	.LBB7_15
.LBB7_9:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_11 Depth 2
	cmp	qword ptr [rsp + 24], 0         # 8-byte Folded Reload
	je	.LBB7_14
# %bb.10:                               #   in Loop: Header=BB7_9 Depth=1
	mov	r15, qword ptr [r12 + 8*rbx]
	xor	r13d, r13d
	jmp	.LBB7_11
	.p2align	4, 0x90
.LBB7_13:                               #   in Loop: Header=BB7_11 Depth=2
	call	putchar@PLT
	inc	r13
	cmp	r14, r13
	je	.LBB7_14
.LBB7_11:                               #   Parent Loop BB7_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmp	byte ptr [r15 + r13], 0
	mov	edi, 46
	je	.LBB7_13
# %bb.12:                               #   in Loop: Header=BB7_11 Depth=2
	mov	edi, 35
	jmp	.LBB7_13
.LBB7_15:
	cmp	qword ptr [rsp], 0              # 8-byte Folded Reload
	je	.LBB7_18
# %bb.16:
	cmp	rbp, 2
	mov	ebx, 1
	cmovae	rbx, rbp
	xor	r14d, r14d
	.p2align	4, 0x90
.LBB7_17:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [r12 + 8*r14]
	call	free@PLT
	inc	r14
	cmp	rbx, r14
	jne	.LBB7_17
.LBB7_18:
	mov	rdi, r12
	call	free@PLT
	xor	eax, eax
	add	rsp, 40
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
.LBB7_27:
	.cfi_def_cfa_offset 96
	mov	rbx, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rbx]
	mov	rdx, qword ptr [r15]
	lea	rsi, [rip + .L.str.3]
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbx]
	mov	rdx, qword ptr [r15]
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
