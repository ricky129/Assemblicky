.data

	array: .word 0, 1, 4, 2, 7, 8, 4, 6

.text

main:

	li	$s0, 0 # int i = 0
	li	$s1, 1 # int ord_c = 1
	move	$s2, $s1 # int ord_sc = 1
	
	li	$t0, 28
	
loop:

	slt	$t1, $s0, $t0
	beq	$t1, $zero, end
	
	move	$t2, $s0  # use $t2 instead of $s0 for 
			  # iterating trough the array
	
	lw	$t4, array($s0) # $t4 = array(i)
	addi	$t2, $t2, 4
	lw	$t5, array($t2) # $t5 = array(i++)
	slt	$t6, $t4, $t5	# array(i)<array(i++)
	beq	$t6, $zero, firstif
	j	continue
	
firstif:

	li	$s2, 0 # ord_sc = 0
	
continue:

	# if (array[i]>array[i+1])
	slt	$t6, $t5, $t4
	beq	$t6, 1, secondif
	j	endloop
	
secondif:

	li	$s1, 0 # ord_c = 0
	j	endloop
	
endloop:

	addi	$s0, $s0, 4
	j	loop
	
end:

	li	$v0, 10
	syscall
