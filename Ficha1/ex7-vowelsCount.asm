.data
	str: .asciz "uoieaup"
	vowels: .ascii "a", "e", "i", "o", "u"
	
.text
	la a0, str
	call vowelsCount
	li a7, 93
	ecall
	
vowelsCount:
	addi sp, sp, -16
	sw ra, 12(sp)
	sw a0, 8(sp)
	
	mv s0, zero
	la s1, vowels
	li s2, 5
	
v0:	beqz s2, vF
	lb a1, 0(s1)
	call charCount
	add s0, s0, a0
	
	lw a0, 8(sp)
	addi s1, s1, 1
	addi s2, s2, -1
	j v0
	
vF:	mv a0, s0
	lw ra, 12(sp)
	addi sp, sp 16
	ret


charCount:
	mv t0, zero
	
c0:	lb t1, 0(a0)
	beqz t1, cF
	bne t1, a1, c1
	addi t0, t0, 1
c1:	addi a0, a0, 1
	j c0
	
cF:	mv a0, t0
	ret