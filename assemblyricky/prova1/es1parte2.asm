.text

main:
	add	$s0, $zero, 4		# int a = 4
	add	$s1, $zero, 10		# int b = 10
	add	$s2, $zero, 8		# int c = 8
	add	$s3, $s2, $zero	# int x = c
	
	slt	$t0, $s1, $s0	# (a > b)
	slt	$t1, $s2, $s0	# (a > c)
	beq	$t0, $zero, else # if ((a > b)...
	
secondcheck:
	beq	$t1, $zero, else # ...(a >c ))
	add	$s3, $s0, $zero	# x = a
	
else:
	slt	$t2, $s2, $s1	# (b > c)
	beq	$t2, $zero, end	# if(b > c)
	
	add	$s3, $s1, $zero	# x = b
	
end:
	li	$v0, 10
	syscall