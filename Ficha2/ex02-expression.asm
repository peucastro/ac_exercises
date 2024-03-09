.data
	A: .float 1.2
	B: .float -0.5
	C: .float 5
	D: .float 4.8

.text
	la t0, A
	la t1, B
	la t2, C
	la t3, D
	flw fa0, 0(t0)
	flw fa1, 0(t1)
	flw fa2, 0(t2)
	flw fa3, 0(t3)
	call expression
	li a7, 10
	ecall
	
expression:
	fsub.s ft0, fa0, fa1
	fmul.s ft0, ft0, fa2
	
	fadd.s ft1, fa3, fa0
	li t0, 3
	fcvt.s.w ft2, t0
	fsub.s ft1, ft1, ft2
	
	fdiv.s fa0, ft0, ft1
	ret