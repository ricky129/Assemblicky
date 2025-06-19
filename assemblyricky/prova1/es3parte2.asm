.text

	addi	$s0, $zero, 7	# int x = 7
	addi	$s1, $zero, 4	# int y = 4
	
	add	$a0, $zero, $s0
	add	$a1, $zero, $s1
	
	jal	dist
	add	$s2, $v0, $zero
	j	end
dist:
	addi	$sp, $sp, -8
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	# $t registers are "caller-saved" (or "call-clobbered"): 
	# This means that if a caller function has important data 
	# in a $t register that it needs after calling another
	# function (the callee), it is the caller's responsibility
	# to save that $t register's value to the stack before making
	# the function call, and then restore it after the call returns.
	
	slt	$t0, $a1, $a0	# (a>b)
	beq	$t0, 1, if	# if(a>b)
	
	sub	$v0, $a1, $a0	# result = b - a
	j	endmethod
if:
	sub	$v0, $a0, $a1	# result = a - b

endmethod:
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	addi	$sp, $sp, 8
	jr	$ra
end:
	addi	$v0, $zero, 10
	syscall