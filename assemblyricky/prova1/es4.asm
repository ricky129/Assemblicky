.text

main:

	li	$s0, 0 # i = 0
	move	$s1, $s0 # n = i
	li	$s2, 18 # int x
	li	$s3, 0 # int y
	
	li	$t0, 32
	
loop:
	
	slt	$t1, $s0, $t0
	beq	$t1, $zero, end
	
	andi 	$s3, $s2, 1
	add	$s1, $s1 $s3
	srl 	$s2, $s2, 1
	addi	$s0, $s0, 1
	
	j	loop
	
end:

	li	$v0, 10
	syscall
