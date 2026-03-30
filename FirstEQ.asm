.data
	a: .word 12
	b: .word 22
	c: .word 32
	d: .word 42
	endl: .asciiz   "\n"
	msg: .asciiz   "12 + 22 + 32 + 42 = "
.text
main:

#first method
addi $t0, $zero, 12
addi $t1, $zero, 22
addi $t2, $zero, 32
addi $t3, $zero, 42

add $t4, $t0, $t1
add $t4, $t4, $t2
add $t4, $t4, $t3

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t4
syscall

li $v0, 4
la $a0, endl
syscall

#second method
li $t0, 12
li $t1, 22
li $t2, 32
li $t3, 42

add $t4, $t0, $t1
add $t4, $t4, $t2
add $t4, $t4, $t3

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t4
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

add $t5, $t1, $t2
add $t5, $t5, $t3
add $t5, $t5, $t4

    
li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, endl
syscall

#fourth method
lw $t0, a
lw $t1, b
lw $t2, c
lw $t3, d

add $t4, $t0, $t1
add $t4, $t4, $t2
add $t4, $t4, $t3

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t4
syscall

li $v0, 4
la $a0, endl
syscall

li $v0, 10
syscall