.data
	R: .space 16
	A: .word 1, 2, 3, 4
	k: .word 2
	n: .word 4
	
.text
	la a0, R
	la a1, A
	lw a2, k
	lw a3, n
	call kVectorSum
	li a7, 10
	ecall
	
kVectorSum:
	addi sp, sp, -16
	sw s0, 12(sp)
	mv s0, a3
	
L0:	beqz s0, LF
	lw t0, 0(a1)
	mul t0, t0, a2
	sw t0, 0(a0)
	
	addi a0, a0, 4
	addi a1, a1, 4
	addi s0, s0 -1
j	L0

LF:	lw s0, 12(sp)
	addi sp, sp 16
	ret