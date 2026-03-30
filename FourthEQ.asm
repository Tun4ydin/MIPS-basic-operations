.data
	a: .word -30
	b: .word -10
	c: .word -8
	d: .word -12
	e: .word 25
	msg: .asciiz	"(-30) + (-10) - ((-8) - (-12) + 25) = "
	endl: .asciiz   "\n"
.text
main:
#first methods
addi $t0, $zero, -30
addi $t1, $zero, -10
addi $t2, $zero, -8
addi $t3, $zero, -12
addi $t4, $zero, 25

sub $t5, $t2, $t3
add $t5, $t5, $t4
add $t6, $t0, $t1
sub $t6, $t6, $t5

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, endl
syscall

# second method
li $t0, -30
li $t1, -10
li $t2, -8
li $t3, -12
li $t4, 25

sub $t5, $t2, $t3
add $t5, $t5, $t4
add $t6, $t0, $t1
sub $t6, $t6, $t5

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t6
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

sub $t6, $t3, $t4
add $t6, $t6, $t5
add $t7, $t1, $t2
sub $t7, $t7, $t6

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t7
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

sub $t5, $t2, $t3
add $t5, $t5, $t4
add $t6, $t0, $t1
sub $t6, $t6, $t5

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, endl
syscall

li $v0, 10
syscall