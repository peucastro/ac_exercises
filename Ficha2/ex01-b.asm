.data
	Y: .double 0.0
	W: .word 7
	X: .double 7.1
	
.text
	la t0, Y
	la t1, W
	la t2, X
	fld fa0, 0(t0)
	lw a0, 0(t1)
	fld fa1, 0(t2)
	call ex1b
	li a7, 10
	ecall
	
ex1b:
	fsqrt.d fa0, fa1
	fcvt.d.w ft0, a0
	fadd.d fa0, fa0, ft0
	ret