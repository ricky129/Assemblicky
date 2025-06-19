.text

main:
	li	$s0, 0		# int i = 0
	move	$s1, $s0	# int n = i
	li	$s2, 18		# $s2 = x
	li	$s3, 0		# $s3 = y
	
loop:
	slti	$t1, $s0, 32	# (i<32)
	beq	$t1, $zero, end	# while (i<32)
	
	andi	$s3, $s2, 1	# y = x & 1
	add	$s1, $s1, $s3	# n=n+y
	srl	$s2, $s2, 1	# x=x>>1
	addi	$s0, $s0, 1	# i=i+1
	
	j	loop
	
end:
	li	$v0, 10
	syscall
	