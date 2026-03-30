.data
	a: .word -15
	b: .word 60
	c: .word 20
	d: .word 45
	e: .word -5
	endl: .asciiz   "\n"
	msg: .asciiz   "(-15) - (60 - (20 - (45 - 5))) = "
.text
main:
#first method
addi $t0, $zero, -15
addi $t1, $zero, 60
addi $t2, $zero, 20
addi $t3, $zero, 45
addi $t4, $zero, -5

add $t5, $t3, $t4
sub $t5, $t2, $t5
sub $t5, $t1, $t5
sub $t5, $t0, $t5

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, endl
syscall

# second method
li $t0, -15
li $t1, 60
li $t2, 20
li $t3, 45
li $t4, -5

add $t5, $t3, $t4
sub $t5, $t2, $t5
sub $t5, $t1, $t5
sub $t5, $t0, $t5

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
lw $t5, 16($t0)

add $t6, $t4, $t5
sub $t6, $t3, $t6
sub $t6, $t2, $t6
sub $t6, $t1, $t6

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
lw $t0 , a
lw $t1, b
lw $t2, c
lw $t3, d
lw $t4, e

add $t5, $t3, $t4
sub $t5, $t2, $t5
sub $t5, $t1, $t5
sub $t5, $t0, $t5

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