.data
	num1: .word 7
	num2: .word 5
	
.text
	la a0, num1
	la a1, num2
	call equalBits
	li a7, 10
	ecall
	
equalBits:
	addi sp, sp, -16
	sw s0, 12(sp)
	sw s1, 8(sp)
	sw s2, 4(sp)
	sw s3, 0(sp)
	
	lw s0, 0(a0)
	lw s1, 0(a1)
	li s2, 32
	add s3, zero, zero
	
l:	beq s2, zero, end
	andi t0, s0, 1
	andi t1, s1, 1
	bne t0, t1, e
	addi s3, s3, 1
e:	srli s0, s0, 1
	srli s1, s1, 1
	addi s2, s2, -1
	j l
	
end:mv a0, s3
	lw s0, 12(sp)
	lw s1, 8(sp)
	lw s2, 4(sp)
	lw s3, 0(sp)
	addi sp, sp, 16
	ret