.data
	P: .half 1, 2, 3, 4
	n: .word 4
	k: .half 10
	
.text
	la a0, P
	lw a1, n
	lh a2, k
	
	call altV
	li a7, 10
	ecall
	
altV:
	srli s0, a1, 1
	slli t0, a2, 16
	add a2, t0, a2
	
l:	beqz s0, f
	lw t0, 0(a0)
	smul16 t0, t0, a2
	sw t0, 0(a0)
	
	addi a0, a0, 4
	addi s0, s0, -1
	
f:	ret