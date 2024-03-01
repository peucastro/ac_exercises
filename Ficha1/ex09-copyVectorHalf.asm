.data
	hVector: .half 1, 2, -3, 4, 5
	wVector: .word 0, 0, 0, 0, 0
	
.text
	la a0, hVector
	la a1, wVector
	li a2, 5
	call copyVector
	li a7, 10
	ecall
	
copyVector:
	mv t0, a2
	
l:	beq t0, zero, e
	lh t1, 0(a0)
	sw t1, 0(a1)
	addi a0, a0, 2
	addi a1, a1, 4
	addi t0, t0, -1
	j l
e:	