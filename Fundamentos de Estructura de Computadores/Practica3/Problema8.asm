.data
textonumero: .asciiz "\n Introduzca un numero:\n"
textosuma: .asciiz "\n La suma es:\n"

.text
.globl main
main:

#Modificar el programa anterior: si el usuario introduce un cero, salir del bucle y presentar por pantalla la suma de los números introducidos hasta el momento.

li $s0, 0
li $t0, 0

while_3:
bgt $t0, 10, fin_while_3

la $a0, textonumero
li $v0, 4
syscall

li $v0, 5
syscall

beqz $v0, fin_while_3

add $s0, $s0, $v0
addi $t0, $t0, 1

j while_3

fin_while_3:

la $a0, textosuma
li $v0, 4
syscall

move $a0, $s0
li $v0, 1
syscall