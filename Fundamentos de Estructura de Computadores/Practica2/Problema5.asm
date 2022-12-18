.data
Numero1: .word 100
Numero2: .word -10
space: .space 4

.text
.globl main
main:

la $t0, Numero1
la $t1, Numero2
la $t2, space

lw $s0, 0($t0)
lw $s1, 0($t1)

add $s2, $s0, $s1

sw $s2, 0($t2)

move $a0, $s2 
li $v0, 1
syscall
