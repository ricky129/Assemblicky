.text

main:

	li	$s0, 7
	li	$s1, 4
	
	move	$a0, $s0
	move	$a1, $s1
	jal	dist
	move	$s3, $v0
	
dist:

	li	$t0, 0 # int result;
	
	# if (a>b)
	slt	$t1, $a1, $a0
	beq	$t1, 1, if
	
	# else
	sub  	$t0, $a1, $a0 # result=b-a;
	move	$v0, $t0
	jr	$ra
	
if:

	sub 	$t0, $a0, $a1 # result=a-b;
	move	$v0, $t0
	jr	$ra
	
