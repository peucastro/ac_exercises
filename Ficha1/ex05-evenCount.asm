.data
	vector: .word 1, 2, -2, -5, 0, 8
	
.text
	li a0, 6
	la a1, vector
	call evenCount
	li a7, 10
	ecall
	
evenCount:
	addi sp, sp, -16
	sw ra, 12(sp)
	
	mv s0, a0			# s0 -> loop control
	mv s1, zero			# s1 -> even counter
l:	beq s0, zero, end	# init loop
	lw a0, 0(a1)		# load curr element
	call isEven			# a0 -> even ? 1 : 0
	add s1, s1, a0		# update counter
	addi a1, a1, 4
	addi s0, s0, -1
	j l
	
	lw ra, 12(sp)
	addi sp, sp, 16
	ret
	
isEven:
	addi sp, sp, -16
	sw s0, 12(sp)
	
	li s0, 0x00000001
	and a0, a0, s0
	bne a0, s0, e
	j end
e:	addi a0, a0, -1

end:lw s0, 12(sp)
	addi sp, sp, 16
	ret