.data
C1: .space 100 #almacena la cadena que introducimos
C2: .space 100 #almacena la cadena traducida
cadena_introduce: .asciiz "Introduzca una cadena:"
cadena_xor: .asciiz "La nueva cadena seria:"

.text
.globl main
main:
li $t0, 0 #inicializacion del iterador i
la $s0, C1 #cargamos la direccion de memoria de C1 en s0

la $a0, cadena_introduce #instrucciones simples para introducir la cadena C1
li $v0, 4
syscall

li $v0, 8
la $a0, C1
li $a1, 100
syscall

jal xor2 #salto a la funcion xor2

la $a0, cadena_xor #instruciones simples para imprimir la cadena C2
li $v0, 4
syscall

la $a0, C2
li $v0, 4
syscall

li $v0, 10 #fin del programa
syscall

xor2: #etiqueta del programa xor2
lb $s0, C1($t0)#almacenamos en $s0, el caracter C1[i]
beqz $s0, fin_xor2 #si es el final, termina el xor2
xor $s0, $s0, 63 #instruccion XOR entre 63 y el caracter
sb $s0, C2($t0) #almacenamos en C2[i] el caracter $s0

addi $t0, $t0, 1 #i++
j xor2 #salto al xor2

fin_xor2:
jr $ra #salta al main
