.data
array1: .space 20

.text
.globl main
main:
li $t0, 5
li $t1, 13
li $t2, -7
li $t3, -5
li $t4, 17

la $s0,array1

sw $t0, 0($s0)
sw $t1, 4($s0)
sw $t2, 8($s0)
sw $t3, 12($s0)
sw $t4, 16($s0)