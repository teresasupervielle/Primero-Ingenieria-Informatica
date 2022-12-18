.data
vector: .word 2,3,5,1
indice: .asciiz "El indice es:"
maximo: .asciiz "\nEl maximo es:"

.text
.globl main
main:

li $t0, 4
li $t1, 1
li $t2, 0 #maximo
li $t3, 0 #indice
li $t4, 0

bucle:
sll $t5, $t4, 2
lw $s0, vector($t5)
move $t6, $s0

j max

max:

blt $t2, $t6, cambio
j sumatorio

cambio:
move $t2, $t6
move $t3, $t1

sumatorio:
add $t1, $t1, 1
sub $t0, $t0, 1
add $t4, $t4, 1
bgtz $t0, bucle

la $a0, indice
li $v0, 4
syscall

move $a0, $t3
li $v0, 1
syscall

la $a0, maximo
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall