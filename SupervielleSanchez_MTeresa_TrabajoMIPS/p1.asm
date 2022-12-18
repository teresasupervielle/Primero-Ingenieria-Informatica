.data #inicializacion de los dos numeros a intercambiar
p1: .word 3
p2: .word 5

.text
.globl main
main:
lw $s0, p1 #almacenamos en s0 el valor de p1
lw $s1, p2 #almacenamos en s1 el valor de p2

move $a0, $s0 #instruciones simples para imprimir los valores que tienen al comienzo
li $v0, 1
syscall

move $a0, $s1
li $v0, 1
syscall

jal swap #llamada a la funcion swap

move $a0, $s0 #instruciones simples para imprimir los valores que tienen tras la funcion
li $v0, 1
syscall

move $a0, $s1
li $v0, 1
syscall

li $v0, 10 #finalizacion del programa
syscall

swap: #etiqueta de la funcion
li $t0, 0 #auxiliar

move $t0, $s0 #aux = p1
move $s0, $s1 #p1 = p2
move $s1, $t0 #p2 = aux

jr $ra #vuelve al main
