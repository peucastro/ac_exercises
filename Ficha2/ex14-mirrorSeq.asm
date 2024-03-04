.data
	pt: .byte 1, 0, 3, 42, 10, 5, 6, 7
	n: .word 4
	
.text
	la a0, pt
	lw a1, n
	call mirrorSeq
	li a7, 10
	ecall
	
mirrorSeq:
	srli a1, a1, 1

l:	lw t0, 0(a0)
	swap8 t0, t0
	sw t0, 0(a0)
	addi a0, a0, 4
	addi a1, a1 ,-1
	bne a1, zero l

	ret