.data
	num: .word 8

.text
	la a0, num
	call MS1
	li a7, 10
	ecall
	
MS1:
	lw a0, 0(a0)
	li s0, 1
	li t0, 31
	
l:	beqz t0, e
	srl t1, a0, t0
	bne t1, s0, n
	j e

n:	addi t0, t0, -1
	j l
	
e:	mv a0, t0