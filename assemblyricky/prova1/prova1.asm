.text

main:

	li	$s0, 4
	li	$s1, 10
	li	$s2, 8
	
	move	$s3, $s2
	
	slt  	$t0, $s1, $s0 # t0 = 1 se a > b
	slt	$t1, $s2, $s0 # t1 = 1 se a > c
	slt	$t2, $s1, $s2 # t2 = b > c
	and	$t0, $t0, $t1 # (a > b) && (a > c)

	beq	$t0, 1, if # if ((a>b) && (a>c))
	beq	$t2, 1, elseif # if (b>c)
	j	end
	
if:	move	$s3, $s0
	j	end

	elseif:	move	$s3, $s1
		j	end

end:
	li	$v0, 1
	syscall