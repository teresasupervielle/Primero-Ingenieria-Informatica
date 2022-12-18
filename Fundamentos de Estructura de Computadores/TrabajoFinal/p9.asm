.data #cadenas instructivas, y guardamos el espacio para el numero
numero: .space 4
cad_introduce: .asciiz "Introduce un numero: "
cad_primo: .asciiz "\nEs primo"
cad_noprimo: .asciiz "\nNo es primo"

.text
.globl main
main:
la $a0, cad_introduce #instrucciones para imprimir la cadena introduce
li $v0, 4
syscall

li $v0, 5 #introducir un numero por teclado
syscall
sw $v0, numero

jal es_primo #salta a la funcion es_primo

beqz $t0, no_primo #como si no es primo, devuelve 0, salta a no primo

la $a0, cad_primo #si devuelve 1 si es primo, por lo tanto imprime esa cadena
li $v0, 4
syscall

j fin #salta a fin

no_primo:
la $a0, cad_noprimo #imprime la cadena no primo
li $v0, 4
syscall

fin: #final del programa
li $v0, 10
syscall

es_primo: #etiqueta de la funcion es primo
beqz $v0, no_lo_es #contamos con que el 0, 1, y 4 no son primos
beq $v0, 1, no_lo_es
beq $v0, 4, no_lo_es

li $t1, 2 #x
li $t2, 2 #2
div $v0, $t2 #dividimos el numero entre 2, para hacer una de las comparaciones
mflo $a0 #nos quedamos el cociente y la almacenamos a a0

for_primo:
bgt $t1, $a0, fin_for # si x > numero/2 se acaba el bucle
rem $t2, $v0, $t1 #si no, almacenamos en t2, el resto del numero entre x
div $v0, $t2 #seguimos dividiendo entre el resto y almacenando el cociente
mflo $a0

bnez $t2, fin_if #hasta que t2, no sea 0, que por lo tanto, si es primo
j no_lo_es #si en algun momento el resto es 0, no es primo

fin_if:
addi $t1, $t1, 1 #x+1
j for_primo #volvemos a for primo

fin_for:
j si_lo_es

no_lo_es: #no primo, devuelve 0
li $t0, 0
jr $ra

si_lo_es: #si primo, devuelve 1
li $t0, 1
jr $ra
