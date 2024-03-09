.data
	P: .float 0.0
	B: .float 7.8
	M: .float 3.6
	N: .float 7.1
	
.text
	la t0, P
	la t1, B
	la t2, M
	la t3, N
	flw fa0, 0(t0)
	flw fa1, 0(t1)
	flw fa2, 0(t2)
	flw fa3, 0(t3)
	call ex1a
	li a7, 10
	ecall
	
ex1a:
	fneg.s fa0, fa2
	fadd.s ft0, fa3, fa1
	fmul.s fa0, fa0, ft0
	ret