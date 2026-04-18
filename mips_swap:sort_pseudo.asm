.data
	array: .word 5,2,3,8,6
	size: .word 5
.text
.globl main
main:
	la $a0, array
	lw $a1, size
	jal sort
	li $v0, 10
	syscall
swap:
	mul $t1, $a1, 4
	add $t1, $a0, $t1
	lw $t0, 0($t1)
	lw $t2, 4($t1)
	sw $t2, 0($t1)
	sw $t0, 4($t1)
	jr $ra
sort:
	li $sp, -20
	sw $ra, 16($sp)
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $s2, 4($sp)
	sw $s3, 0($sp)
	move $s2, $a0
	move $s3, $a1
	li $s0, 0
	for1tst:
		bge $s0, $s3, exit1
		subi $s1, $s0, 1
	for2tst:
		blt $s1, $zero, exit2
		mul $t1, $s1, 4
		add $t2, $s2, $t1
		lw $t3, 0($t2)
		lw $t4, 4($t2)
		bge $t4, $t3, exit2
		move $a0, $s2
		move $a1, $s1
		jal swap
		subi $s1, $s1, 1
		j for2tst
	exit2:
		addi $s0, $s0, 1
		j for1tst
	exit1:
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $ra, 16($sp)
		li $sp, 0
		jr $ra
	
