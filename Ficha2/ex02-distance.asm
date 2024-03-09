.data
	P1: .float 1.0, 2.0
	P2: .float 4.0, 8.0
	
.text
	la t0, P1
	la t1, P2
	
	flw fa0, 0(t0)	# x1
	flw fa1, 4(t0)	# y1
	flw fa2, 0(t1)	# x2
	flw fa3, 4(t1)	# y2
	
	call distance
	li a7, 10
	ecall
	
distance:
	fsub.s ft0, fa0, fa2
	fsub.s ft1, fa1, fa3
	
	fmul.s ft0, ft0, ft0
	fmul.s ft1, ft1, ft1
	
	fadd.s fa0, ft0, ft1
	fsqrt.s fa0, fa0
	ret