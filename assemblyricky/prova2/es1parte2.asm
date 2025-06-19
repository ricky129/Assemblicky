.text

main:
	addi	$s0, $zero, 16		# int x = 16
	addi	$s1, $zero, 18		# int y = 18
	addi	$s2, $zero, 0		# int p = 0
	addi	$s3, $zero, 0		# int i = 0
	addi	$s4, $zero, 0		# int temp = 0
	
	addi	$t0, $zero, 32
	
loop:
	slt	$t1, $s3, $t0
	beq	$t1, $zero, end
	
	andi	$s4, $s1, 1	# tmp = y & 1
	
	bne	$s4, 1, continue	# if (tmp!=0)
	add	$s2, $s2, $s0		# p = p + x
	
continue:
	srl	$s1, $s1, 1		# y = y >> 1
	sll	$s0, $s0, 1		# x = x << 1
	addi	$s3, $s3, 1		# i++
	j	loop
	
end:
	addi	$v0, $zero, 10
	syscall