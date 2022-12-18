.data
operador1: .space 4
operador2: .space 4
texto1: .asciiz "Introduzca operador 1:"
texto2: .asciiz "\nIntroduzca operador 2:"
textor: .asciiz "\nEl resultado es:"

.text
.globl main
main:
li $t3, 0
la $a0, texto1
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, operador1

la $a0, texto2
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, operador2

lw $t0, operador1($t3)
lw $t1, operador2($t3)

add $t2, $t0, $t1

la $a0, textor
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall