.data
	v1: .word 1, 2, 3, 4, 5
	v2: .word 3, 4, 5, 6, 7
	
.text
	la a0, v1
	la a1, v2
	li a2, 5
	call MAXMED
	li a7, 10
	ecall

MAXMED:
	addi sp, sp, -16
	sw ra, 12(sp)
	sw t0, 8(sp)
	
	mv t0, a1
	mv a1, a2
	call MEDIA
	mv s0, a0
	mv a0, t0
	call MEDIA
	mv s1, a0
	
	bge s0, s1, e
	div a0, s1, a1
	j f
e:	div a0, s0, a1

f:	lw t0, 8(sp)
	lw ra, 12(sp)
	addi sp, sp, 16
	ret


MEDIA:
	addi sp, sp, -16
	sw s0, 12(sp)
	sw s1, 8(sp)
	
	mv s0, zero
	add s1, zero, a1
	
l:	beq s1, zero, d
	lw t0, 0(a0)
	add s0, s0, t0
	addi a0, a0, 4
	addi s1, s1, -1
	j l

d:	div a0, s0, a1
	lw s1, 8(sp)
	lw s0, 12(sp)
	addi sp, sp, 16
	ret
	