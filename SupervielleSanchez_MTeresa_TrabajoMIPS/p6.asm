.data #cadenas instructivas
cadena_introduce: .asciiz "Introduzca una caracter: "
cadena_hexa: .asciiz "\nEl valor numerico en hexadecimal es: "
.text
.globl main
main:
li $t0, 0 #inicializar el contador

la $a0, cadena_introduce #instrucciones basicas para imprimir por pantalla la cadena introduce
li $v0, 4
syscall

li $v0, 12 #introducir por teclado el caracter
syscall
move $a0, $v0

jal isdigit #salta a funcion isdigit

beq $v0, -1, fin #si se devuelve -1 es una letra, por lo tanto no se devuelve el valor hexadecimal

la $a0, cadena_hexa #instrucciones basicas para imprimir la cadena hexa
li $v0, 4
syscall

move $a0, $t0 #imprime el valor en hexadecimal correspondiente en la tabla ascii
li $v0, 1
syscall

fin:
li $v0, 10 #fin del programa
syscall

isdigit: #etiqueta de la funcion isdigit
blt $a0, 48, fin_isdigit #el funcionamiento de isdigit esta explicada en el ejercicio anterior
bgt $a0, 57, fin_isdigit
j valor #salta a valor

valor:
beq $t0, $a0, fin_atras #mientras que el contador sea distinto al numero hexadecimal introducido
addi $t0, $t0, 1 #el contador sequirá sumando
j valor

fin_isdigit: #esto pasa cuando es letra
li $v0, -1

fin_atras:
jr $ra #volver al main
