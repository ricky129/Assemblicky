.data

	array0: .word 0,1,4,2,7,8,4,6
	
.text

	li	$s0, 4	# int i = 1
	lw	$s1, array0($zero) # int x = array(0)
	
	li	$t0, 32
	
loop:
	# while (i<8)
	slt 	$t1, $s0, $t0
	beq	$t1, $zero, end
	
	# if (array[i]>x)
	lw	$t3, array0($s0)
	slt	$t2, $s1, $t3
	beq	$t2, 1, if

	addi	$s0, $s0, 4 # i=i+1;
	j	loop
	
if:
	lw	$s1, array0($s0) # x=array[i];
	addi	$s0, $s0, 4 # i=i+1;
	j loop
	

end:	
	li	$v0, 1
	syscall

	