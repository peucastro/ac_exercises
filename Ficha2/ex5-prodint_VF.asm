.data
	X: .float -2.0, 4.0, -3.0026, -5,0, 0.0
	Y: .float 8.0, 1.4, -1.0, -4.0, 3.0
	n: .word 5

.text
	la a0, X
	la a1, Y
	lw a2, n
	call prodint_VF
	li a7, 10
	ecall
	
prodint_VF:
	fcvt.s.w ft7, zero
	
l:	beqz a2, f
	flw ft0, 0(a0)
	flw ft1, 0(a1)
	fmadd.d ft7, ft0, ft1, ft7
	addi a0, a0, 4
	addi a1, a1, 4
	addi a2, a2, -1
	
f:	fcvt.d.s fa0, ft7
	fadd.d fa0, fa0, fs0
	ret