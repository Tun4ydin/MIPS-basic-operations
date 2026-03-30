.data
	a: .word 45
	b: .word 25
	c: .word 10
	d: .word 2
	msg: .asciiz "(45 & 25) ^ (~10 | 2) = "
	endl: .asciiz "\n"
.text
main:
#first method
addi $t0, $zero, 45
addi $t1, $zero, 25
addi $t2, $zero, 10
addi $t3, $zero, 2

and $t4, $t0, $t1
nor $t2, $t2, $zero
or $t5, $t2, $t3
xor $t5, $t5, $t4

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, endl
syscall

#second method
li $t0, 45
li $t1, 25
li $t2, 10
li $t3, 2

and $t4, $t0, $t1
nor $t2, $t2, $zero
or $t5, $t2, $t3
xor $t5, $t5, $t4

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t5
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

and $t5, $t1, $t2
nor $t3, $t3, $zero
or $t6, $t3, $t4
xor $t6, $t6, $t5

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, endl
syscall

#fourth method
lw $t0, a
lw $t1, b
lw $t2, c
lw $t3, d

and $t4, $t0, $t1
nor $t2, $t2, $zero
or $t5, $t2, $t3
xor $t5, $t5, $t4

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, endl
syscall

li $v0, 10
syscall