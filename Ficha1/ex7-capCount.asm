.data
	str: .asciz "AaaB cDe FGH"

.text
	la a0, str
	call capCount
	li a7, 93
	ecall

capCount:
	mv t0, zero
	li t1, 65
	li t2, 90

L0:	lb t3, 0(a0)
	beqz t3, LF
	blt t3, t1, L1
	bgt t3, t2, L1
	addi t0, t0, 1
L1:	addi a0, a0, 1
	j L0
	
LF:	mv a0, t0
	ret
