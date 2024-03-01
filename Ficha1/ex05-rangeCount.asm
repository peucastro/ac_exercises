.data
	vector: .word -3, -2, -1, 0, 1, 2, 3, 4, 5, 6
	
.text
	li a0, 10
	la a1, vector
	li a2, -2		# lower bound
	li a3, 5		# upper bound
	call rangeCount
	li a7, 10
	ecall
	
rangeCount:
	addi sp, sp, -16
	sw ra, 12(sp)
	sw a1, 8(sp)
	sw s0, 4(sp)
	sw s1, 0(sp)
	
	mv s0, a0
l:	beq s0, zero, end
	lw a0, 0(a1)
	call inRange
	add s1, s1, a0
	addi a1, a1, 4
	addi s0, s0, -1
	j l
	
end:mv a0, s1
	lw s1, 0(sp)
	lw s0, 4(sp)
	lw a1, 8(sp)
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

inRange:
	bge a0, a2, c1
	j e
c1:	bge a3, a0, c2
	j e
c2:	addi a0, zero, 1
	j f
e:	add a0, zero, zero
f:	ret