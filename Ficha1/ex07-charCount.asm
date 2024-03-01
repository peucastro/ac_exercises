.data
	str: .asciz "lacb iic iiia an ai isii"
	
.text
	la a0, str
	li a1, 'i'
	call charCount
	li a7, 10
	ecall
	
charCount:
	mv s0, zero
	
l:	lb t0, 0(a0)
	beq t0, zero, end
	bne t0, a1, n
	addi s0, s0, 1
n:	addi a0, a0, 1
	j l

end:mv a0, s0
	ret