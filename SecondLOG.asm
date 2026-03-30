.data
	a: .word 18
	b: .word 12
	c: .word 22
	d: .word 8
	e: .word 14
	f: .word 6
	msg: .asciiz "~(18 | 12) & (22 | 8 | ~(~14 & 6)) = "
	endl: .asciiz "\n"
.text
main:
#first method
addi $t0, $zero, 18
addi $t1, $zero, 12
addi $t2, $zero, 22
addi $t3, $zero, 8
addi $t4, $zero, 14
addi $t5, $zero, 6

or $t6, $t1, $t2
nor $t6, $t6, $zero
nor $t4, $t4, $zero
and $t7, $t4, $t5
nor $t7, $t7, $zero
or $t7, $t3, $t7
or $t7, $t2, $t7
and $t7, $t6, $t7

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t7
syscall

li $v0, 4
la $a0, endl
syscall 

#second method
li $t0, 18
li $t1, 12
li $t2, 22
li $t3, 8
li $t4, 14
li $t5, 6

or $t6, $t1, $t2
nor $t6, $t6, $zero
nor $t4, $t4, $zero
and $t7, $t4, $t5
nor $t7, $t7, $zero
or $t7, $t3, $t7
or $t7, $t2, $t7
and $t7, $t6, $t7

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t7
syscall

li $v0, 4
la $a0, endl
syscall 

#third method
lui $t0, 0x1001
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
lw $t4, 12($t0)
lw $t5, 16($t0)
lw $t6, 20($t0)

or $t7, $t2, $t3
nor $t7, $t7, $zero
nor $t5, $t5, $zero
and $t8, $t5, $t6
nor $t8, $t8, $zero
or $t8, $t4, $t8
or $t8, $t3, $t8
and $t8, $t7, $t8

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t8
syscall

li $v0, 4
la $a0, endl
syscall

#fourth method
lw $t0, a
lw $t1, b
lw $t2, c
lw $t3, d
lw $t4, e
lw $t5, f

or $t6, $t1, $t2
nor $t6, $t6, $zero
nor $t4, $t4, $zero
and $t7, $t4, $t5
nor $t7, $t7, $zero
or $t7, $t3, $t7
or $t7, $t2, $t7
and $t7, $t6, $t7

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t7
syscall

li $v0, 4
la $a0, endl
syscall 

li $v0, 10
syscall