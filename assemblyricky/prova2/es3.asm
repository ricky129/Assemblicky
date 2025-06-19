.text

main:

	li	$s0, 7 # int a = 7
	li	$s1, 4 # int b = 4
	li	$s2, 4 # int c = 4
	li	$s3, 2 # int d = 2
	
	move	$a0, $s0
	move	$a1, $s1
	move	$a2, $s2
	move	$a3, $s3
	jal 	dist
	move	$s4, $v0
	j	end
	
dist:

	addi	$sp, $sp, -20 # make space on stack
	# save variables on stack
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$t0, 12($sp)
	sw	$t1, 16($sp)
	
	add	$t0, $a0, $a1 # a + b
	sub	$t1, $a2, $a3 # c - d
	srlv	$t0, $t0, $t1 # (a+b)>>(c-d)
	sllv 	$t1, $a1, $a3 # b<<d
	add	$v0, $t0, $t1 # (a+b)>>(c-d)+b<<d
	
	# restore variables from stack
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8 ($sp)
	lw	$t0, 12($sp)
	lw	$t1, 16($sp)
	addi	$sp, $sp, 20 # deallocate stack space
	
	jr	$ra
	
end:

	li	$v0, 10
	syscall
	
