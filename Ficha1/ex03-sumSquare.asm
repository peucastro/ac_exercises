.data
	num: .word 5
	
.text
	la t0, num
	lw a0, 0(t0)
	jal ra, sumSquare
	li a7, 10
	ecall
	
sumSquare:
	addi sp, sp, -16
	sw ra, 12(sp)
	sw s0, 8(sp)
	sw s1, 4(sp)
	
	mv s0, a0		# s0 = loop counter
	add s1, x0, x0		# s1 = var sum
	blt s0, zero, end	# check if num < 0

l:	beq s0, zero, end
	call square	
	add s1, s1, a0		# sum += square(counter)
	addi s0, s0, -1		# decrements counter
	mv a0, s0		# update a0 value
	j l
		
end:mv a0, s1		# a0 = sum 
	lw s1, 4(sp)
	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, sp, 16
	ret
		
square:
	mul a0, a0, a0			# a0 = a0^2
	ret
