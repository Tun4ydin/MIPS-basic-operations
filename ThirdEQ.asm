.data
	a: .word 15
	b: .word 25
	c: .word 9
	d: .word 4
	e: .word -2
	endl: .asciiz   "\n"
	msg: .asciiz   "(15 + 25) - (9 + 4 - 2) = "
.text
main:
#first method
addi $t0, $zero, 15
addi $t1, $zero, 25
addi $t2, $zero, 9
addi $t3, $zero, 4
addi $t4, $zero, -2

add $t5, $t0, $t1
add $t6, $t2, $t3
add $t6, $t6, $t4
sub $t7, $t5, $t6

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t7
syscall

li $v0, 4
la $a0, endl
syscall

# second method
li $t0, 15
li $t1, 25
li $t2, 9
li $t3, 4
li $t4, -2

add $t5, $t0, $t1
add $t6, $t2, $t3
add $t6, $t6, $t4
sub $t7, $t5, $t6

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

add $t6, $t1, $t2
add $t7, $t3, $t4
add $t7, $t7, $t5
sub $t8, $t6, $t7

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

add $t5, $t0, $t1
add $t6, $t2, $t3
add $t6, $t6, $t4
sub $t7, $t5, $t6

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