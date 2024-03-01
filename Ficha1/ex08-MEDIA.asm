.data
	vector: .word 1, 2, 3, 4, 5
	
.text
	la a0, vector
	li a1, 5
	call MEDIA
	li a7, 10
	ecall
	
MEDIA:
	mv s0, zero
	add s1, zero, a1
	
l:	beq s1, zero, e
	lw t0, 0(a0)
	add s0, s0, t0
	addi a0, a0, 4
	addi s1, s1, -1
	j l

e:	div a0, s0, a1
	ret