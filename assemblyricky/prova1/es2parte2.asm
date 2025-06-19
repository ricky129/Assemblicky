.data

	array: .word 0,1,4,2,7,8,4,6
	
.text

main:
	addi	$s0, $zero, 4		# int i = 1
	lw	$s1, array($zero)	# int x = array(0)
	
	addi	$t0, $zero, 32
	
loop:
	slt	$t1, $s0, $t0		# (i < 8)
	beq	$t1, $zero, end		# while (i<8)
	
	lw	$t2, array($s0)		# array[i]
	slt	$t3, $s1, $t2		# (array[i]>x)
	beq	$t3, 1, if		# if (array[i]>x)
	add	$s0, $s0, 4		# i++
	j	loop
if:
	add	$s1, $t2, $zero		# x=array[i]
	addi	$s0, $s0, 4		# i++
	j	loop
	
end:
	addi	$v0, $zero, 10
	syscall