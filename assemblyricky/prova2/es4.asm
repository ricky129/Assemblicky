.text

main:

	li	$s0, 9 # int x = 9
	li	$s1, 6 # int y = 6
	li	$s2, 0 # int w = 0
	
	# if (x & y)
	and	$t0, $s0, $s1
	bne	$t0, $zero, firstif
	
# firstelse:
	
	# if (x && y)
	and	$t0, $s0, 1
	and	$t1, $s1, 1
	and	$t0, $t0, $t1
	beq	$t0, 1, secondelse
	j	end
	
firstif:

	li	$s2, 1 # w = 1
	j	end
	
secondelse:

	li	$s2, 2	# w = 2
	
end:

	li	$v0, 10
	syscall
