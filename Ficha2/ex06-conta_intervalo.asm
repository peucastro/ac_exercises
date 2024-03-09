.data
	v: .float 0.11, 3.1, 10.1
	n: .word 3
	a: .float 0.0
	b: .float 10.0

.text
	la a0, v
	lw a1, n
	la t0, a
	flw fa0, 0(t0)
	la t1, b
	flw fa1, 0(t1)
	
	call conta_intervalo
	li a7, 10
	ecall

# int conta_intervalo(float *V, int n, float a, float b)
conta_intervalo:
	mv t6, zero
	
l:	beqz a1, f
	addi a1, a1, -1
	flw ft0, 0(a0)
	addi a0, a0, 4
	
	fle.s t0, fa0, ft0
	beqz t0, l
	
	fle.s t0, ft0, fa1
	beqz t0, l
	
	addi t6, t6, 1
	j l
	
f:	mv a0, t6
	ret	