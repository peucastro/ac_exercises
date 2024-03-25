.data
	R: .space 16
	A: .word 1, 2, 3, 4
	B: .word 5, 6, 7, 8
	n: .word 4
	
.text
	la a0, R
	la a1, A
	la a2, B
	lw a3, n
	call vectorSum
	li a7, 10
	ecall
	
vectorSum:
	addi sp, sp, -16
	sw s0, 12(sp)
	mv s0, a3
	
L0: beqz s0, LF
	lw t1, 0(a1)
	lw t2, 0(a2)
	add t0, t1, t2
	sw t0, 0(a0)
	
	addi a0, a0, 4
	addi a1, a1, 4
	addi a2, a2, 4
	addi s0, s0 -1
j	L0

LF:	lw s0, 12(sp)
	addi sp, sp 16
	ret