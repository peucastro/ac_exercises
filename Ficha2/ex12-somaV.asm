.data
	P: .half 10, 25, 15, 2
	Q: .half 40, 15, 15, 18
	R: .space 8
	n: .word 4
	
.text
	la a0, P
	la a1, Q
	la a2, R
	lw a3, n
	call somaV
	li a7, 10
	ecall
	
somaV:
	srli s0, a3, 1
	
l:	beqz s0, f
	lw t0, 0(a0)
	lw t1, 0(a1)
	add16 t0, t0, t1
	sw t0, 0(a2)
	
	addi a0, a0, 4
	addi a1, a1, 4
	addi a2, a2, 4
	addi s0, s0, -1
	j l
	
f:	ret	
