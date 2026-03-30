.data
	a: .word 0x5A
	b: .word 0xFF
	c: .word 0xC3
	d: .word 0x0F
	e: .word 0x0B
	msg: .asciiz "(0x5A & 0xFF) | ((0xC3 & 0x0F) ^ 0x0B) = "
	endl: .asciiz "\n"
.text
main:
#first method
addi $t0, $zero, 0x5A
addi $t1, $zero, 0xFF
addi $t2, $zero, 0xC3
addi $t3, $zero, 0x0F
addi $t4, $zero, 0x0B

and $t5, $t0, $t1
and $t6, $t2, $t3
xor $t6, $t6, $t4
or $t6, $t5, $t6

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, endl
syscall 
#second method
li $t0, 0x5A
li $t1, 0xFF
li $t2, 0xC3
li $t3, 0x0F
li $t4, 0x0B

and $t5, $t0, $t1
and $t6, $t2, $t3
xor $t6, $t6, $t4
or $t6, $t4, $t6

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

and $t6, $t1, $t2
and $t7, $t3, $t4
xor $t7, $t7, $t5
or $t7, $t6, $t7

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
lw $t4, e

and $t5, $t0, $t1
and $t6, $t2, $t3
xor $t6, $t6, $t4
or $t6, $t5, $t6

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