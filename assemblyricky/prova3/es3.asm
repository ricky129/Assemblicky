.data
	array:	.word 0,1,2,4,4,6,7,9

.text
main:
	li	$s5, 8		# int n = 8
	sra	$s0, $s5, 1	# int i = n/2
	subi	$s1, $s5, 1	# int up = n-1
	li	$s2, 0		# int low = 0
	li	$s3, -1		# int found = -1
	li	$s4, 6		# int elem = 6
	bne	$s1, $s2, label	# (up != low)
label:	
	slt	$t0, $s3, 0	# (found < 0)
	beq	$t0, 1, loop	# while ((found < 0) && (up != low))
	j	end
loop:
	lw	$t1, array($s0)		# (array[i] == elem)
	beq	$t1, $s4, firstif 	# if (array[i] == elem)
	
	# else
	sgt	$t2, $t1, $s4		# (array[i] > elem)
	beq	$t2, 1, secondif 	# if (array[i] > elem)
	move	$s2, $s0		# low = i
	j	fineloop
	
firstif:
	move	$s3, $s0	# found = i
	j	fineloop
	
secondif:
	move	$s1, $s0	# up = i
	
fineloop:
	add	$t2, $s1, $s2	# (up + low)
	sra	$s0, $t2, 1	# (up + low)/2
	j	label
end:
	li	$v0, 10
	syscall
