.data
	V: .byte 1, 2, 3, 4, 5, 6, 3, 8
	n: .word 8
	lim: .byte 4
	
.text
	la a0, V
	lw a1, n
	lb a2, lim
	call conta_inf
	li a7, 10
	ecall
	
conta_inf:
	srli s0, a1, 2	# index = n / 4
	slli t0, a2, 8
	add t0, t0, a2
	slli s1, t0, 16
	add s1, s1 t0 	# mask
	mv s2, zero		# counter = 0
	
l:	beqz s0, f
	lw t0, 0(a0)
	scmplt8 t0, t0, s1
	add8 s2, s2, t0
	
	addi a0, a0, 4
	addi s0, s0, -1
	j l

f:	mv a0, zero

L0:	andi t0, s2 0x0FF
	add a0, a0, t0
	srli s2, s2, 8
	bnez s2, L0
	
	neg a0, a0
	ret