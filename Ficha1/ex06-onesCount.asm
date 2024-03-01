.data
	num: .word 0xABC
		
.text
	la t0, num
	lw a0, 0(t0)
	call onesCount
	li a7, 10
	ecall
	
onesCount:
	mv s0, zero
	
l:	beqz a0, end
	andi t0, a0, 1
	add s0, s0, t0
	srli a0, a0, 1
	j l
	
end:mv a0, s0
	ret
