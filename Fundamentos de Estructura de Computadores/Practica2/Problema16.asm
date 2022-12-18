.data
vector: .word 1, 2, 3, 4
texto: .asciiz "VECTOR={"
coma: .asciiz ", "
fintex: .asciiz "}"

.text
.globl main
main:
li $t0, 0
li $t3, 0
li $t4, 4

la $a0, texto
li $v0, 4
syscall

bucle:
sll $t1, $t0, 2
lw $s0, vector($t1)
move $t2, $s0

move $a0, $t2
li $v0, 1
syscall

la $a0, coma
li $v0, 4
syscall

add $t0, $t0, 1
sub $t4, $t4, 1
bgtz $t4, bucle

la $a0, fintex
li $v0, 4
syscall