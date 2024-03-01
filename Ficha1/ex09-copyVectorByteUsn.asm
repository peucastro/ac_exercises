.data
	bVector: .byte -1, 2, -3, 4, 5
	wVector: .word 0, 0, 0, 0, 0
	
.text
	la a0, bVector
	la a1, wVector
	li a2, 5
	call copyVector
	li a7, 10
	ecall
	
copyVector:
	mv t0, a2
	addi t2, zero, -1
	
l:	beq t0, zero, e
	lb t1, 0(a0)
	bge t1, zero, p
	mul t1, t1, t2
p:	sw t1, 0(a1)
	addi a0, a0, 1
	addi a1, a1, 4
	addi t0, t0, -1
	j l
e:	