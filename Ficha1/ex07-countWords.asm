.data
	str: .asciz "meu nome e pedro"
	
.text
	la a0, str
	li a1, ' '
	call countWords
	li a7, 10
	ecall
	
countWords:
	li s0, 1
	
l:	lb t0, 0(a0)
	beq t0, zero, end
	bne t0, a1, n
	addi s0, s0, 1
n:	addi a0, a0, 1
	j l

end:mv a0, s0
	ret