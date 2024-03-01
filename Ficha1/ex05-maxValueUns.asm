.data
    vector: .word -12, 50, 0, -70, 100
    
.text
    la a0, vector
    li a1, 5
    call maxUns
    li a7, 10
    ecall
    
maxUns:
    li s0, 0   			# Initialize s0 to the minimum possible unsigned word value
    li t0, 0			# Loop index at 0
l:  beq t0, a1, end     # Check if the loop counter t0 is equal to the length of the vector
    lw t1, 0(a0)        # Load current element of the vector
    bltu t1, s0, ls     # Check if t1 is greater than s0
    mv s0, t1           # Update max value if t1 is greater
ls: addi a0, a0, 4     	# Move to the next element of the vector
    addi t0, t0, 1     	# Increment loop counter
    j l                 # Jump back to the beginning of the loop
    
end: mv a0, s0          # Move the maximum value to a0 for return
     ret                # Return from the subroutine