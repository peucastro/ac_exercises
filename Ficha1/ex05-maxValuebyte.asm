.data
	vector: .byte 4, 2, -3, 14, 7, 0, -1
	
.text
	la a0, vector
	li a1, 7
	call maxValue
	li a7, 10
	ecall
	
maxValue:
	beqz a1, end

	lb s0, 0(a0)
l:	addi a1, a1, -1
	beqz a1, end		# loop control
	lb s1, 0(a0)		# load curr value using lb
	blt s1, s0, ls		# value < max ?
	mv s0, s1			# update value
ls:	addi a0, a0, 1		# next element
	j l
	
end:mv a0, s0
	ret
