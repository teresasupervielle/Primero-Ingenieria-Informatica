.data
textonumero: .asciiz "\n Introduzca un numero:\n"
textosuma: .asciiz "\n La suma es:\n"

.text
.globl main
main:

#Escribir en ensamblador MIPS un programa que utilice una llamada al sistema (syscall) para pedir números al usuario. Después de 10 iteraciones, el programa debe imprimir por pantalla la suma de los números introducidos.

li $s0, 0
li $t0, 0

while_2:
bgt $t0, 10, fin_while_2

la $a0, textonumero
li $v0, 4
syscall

li $v0, 5
syscall

add $s0, $s0, $v0
addi $t0, $t0, 1

j while

fin_while_2:

la $a0, textosuma
li $v0, 4
syscall

move $a0, $s0
li $v0, 1
syscall