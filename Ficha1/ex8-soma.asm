.data
	V1: .word 10, 20, 30, 40, 50
	V2: .word 20, 40, 600, 800, 300
	n: .word 5
	
.text
	la a0, V1
	la a1, V2
	lw a2, n
	jal ra, MAXMED
	li a7, 10
	ecall

#int maxmed(int *v1, int *v2, int n)
MAXMED:
	addi sp, sp, -16
	sw ra, 12(sp)
	sw a2, 8(sp)
	sw a1, 4(sp)
	
	mv a1, a2
	jal ra, MEDIA
	
	lw a1, 8(sp)
	sw a0, 8(sp)
	lw a0, 4(sp)
	
	jal ra, MEDIA
	lw t0, 8(sp)
	
	bge a0, t0, g
	mv a0, t0

g:	lw ra, 12(sp)
	addi sp, sp, 16
	ret
	
#int media(int *v1, int n)
MEDIA:
	addi, sp, sp, -16
	sw ra, 12(sp)
	sw a1, 8(sp)
	
	mv s0, a1
	call SOMA
	
	lw a1, 8(sp)
	div a0, a0, a1
	lw ra, 12(sp)
	addi, sp, sp, 16
	ret	

SOMA:
	mv t1, zero
l:	beqz a1, e
	lw t0, 0(a0)
	add t1, t1, t0
	addi a0, a0, 4
	addi a1, a1, -1
	j l
	
e:	mv a0, t1
	ret