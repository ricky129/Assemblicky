.text

main:

	li	$s0, 16	# int x = 16
	li	$s1, 0 	# int y = 0
	li	$s2, 0	# int i = 0
	li	$s3, 0	# int p = 0
	
	li	$t0, 32
	
	
loop:

	slt	$t1, $s2, $t0
	beq	$t1, 1, end
	
	andi	$t2, $s0, 1	# (x & 1)
	add	$s1, $s1, $t2	# y=y+(x & 1)
	srl	$s0, $s0, 1
	addi	$s2, $s2, 1
	
	j	loop
	
end:

	andi	$s3, $s1, 1	# p = y % 2
