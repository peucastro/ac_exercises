.data
	vector: .half -2, 0, 7, -12, 97, -11
	
.text
	li a0, 6
	la a1, vector
	call minValue
	li a7, 10
	ecall
	
minValue:
	addi sp, sp, -16
	sw s0, 12(sp)
	sw s1, 8(sp)
	
	li s0, 0x8FFF
l:	beq a0, zero, end
	lh s1, 0(a1)
	bge s1, t0, e
	add s0, zero, s1
e:	addi a1, a1, 4
	addi a0, a0, -1
	j l

end:mv a0, s0
	lw t1, 8(sp)
	lw t0, 12(sp)	
	addi sp, sp, 16
	ret