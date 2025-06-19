.text

main:

	li	$s0, 16 # int x = 16
	li	$s1, 18 # int y = 18
	li	$s2, 0 # int p = 0
	li	$s3, 0 # int i = 0
	li	$s4, 0 # int tmp = 0
	
	li	$t0, 32
	
loop:
	# while (i<32)
	slt	$t1, $s3, $t0
	beq	$t1, $zero, end
	
	andi	$s4, $s1, 1 # tmp=y & 1;
	
	# if (tmp!=0)
	beq	$s4, 1, if
	j	label
if:	

	add	$s2, $s2, $s0 # p=p+x;
	
label:

	srl	$s1, $s1, 1
	sll	$s0, $s0, 1
	addi	$s3, $s3, 1
	j	loop
	
end:
	li	$v0, 10
	syscall