.data #solo es la cadena para imprimir la coma
coma: .asciiz ","

.text
.globl main
main:
li $t0, 0 #i = 0

li $s0, 2 #el 2, 3, 5, 7 son los divisores utilizados para criba, por lo tanto, lo almacenamos en s0, s1, s2 y s3
li $s1, 3
li $s2, 5
li $s3, 7

for:
bgt $t0, 100, fin_for #cuando i>100, se termina el bucle

jal criba #salta a la criba

addi $t0, $t0, 1 #se incrementa el iterador del bucle
j for #salta al bucle

fin_for:
li $v0, 10 #fin del programa
syscall

criba:
beq $t0, 2, cambio #como estos ya sabemos que son primos, saltamos a cambio
beq $t0, 3, cambio
beq $t0, 5, cambio
beq $t0, 7, cambio

rem $t2, $t0, $s0 #empezamos las comparaciones, a ver si el numero t0, es multiplo de s0, s1, s2 0 s3
beqz $t2, fin

rem $t2, $t0, $s1
beqz $t2, fin

rem $t2, $t0, $s2
beqz $t2, fin

rem $t2, $t0, $s3
beqz $t2, fin

cambio: #aqui se imprime el numero, ya que si es primo
move $a0, $t0
li $v0, 1  
syscall 

li $v0, 4 #imprime la coma
la $a0, coma
syscall 

fin:
jr $ra #salta a main
