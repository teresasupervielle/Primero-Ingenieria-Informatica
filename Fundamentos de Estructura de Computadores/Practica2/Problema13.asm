.data
array1: .word 2, 34, 12, -4, 6
array2: .space 12

.text
.globl main
main:

li $t0, 2
li $t3, 0
li $t5, 3

bucle:
sll $t1, $t0, 2
lw $s0, array1($t1)
move $t2, $s0

sll $t4, $t3, 2
sw $t2, array2($t4)

add $t0, $t0, 1
add $t3, $t3, 1
sub $t5, $t5, 1
bgtz $t5, bucle