.data
	pi: .float 3.14159
	radius: .float 5.0

.text
	la t0, pi
	la t1, radius
	flw fa0, 0(t0)
	flw fa1, 0(t1)
	call circle_area
	li a7, 10
	ecall
	
circle_area:
	fmul.s ft0, fa1, fa1	# ft0 = radius ^ 2
	fmul.s fa0, fa0, ft0	# fa0 = pi * radius ^ 2
	ret