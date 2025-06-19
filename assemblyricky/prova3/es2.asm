.text
main:
	li	$s0, 47	# int a = 47
	li	$s1, 4	# int b = 4
	li	$s2, 0	# int v = 0
	
	jal	ror
	move	$s2, $v0
	j	end
ror:
	li	$t0, 0 # int q = 0
	addi	$sp, $sp, -16
	
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$t0, 8($sp)
	sw	$t1, 12($sp)
	
	li	$t1, 32
	sub	$t2, $t1, $s2	# (32-n)
	sllv 	$t0, $s0, $t2	# q=p << (32-n)
	srlv 	$s0, $s0, $s1
	or	$v0, $s0, $s1
	
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$t0, 8($sp)
	lw	$t1, 12($sp)
	
	jr	$ra
	
end:
	li	$v0, 10
	syscall