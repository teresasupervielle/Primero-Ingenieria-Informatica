.data #guardamos espacio para el caracter, y las cadenas que nos avisaran si es letra o numero
caracter: .space 1
cadena_introduce: .asciiz  "Introduce un caracter:\n"
cadena_num: .asciiz "\nEste caracter es un numero"
cadena_let: .asciiz "\nEste caracter es una letra"

.text
.globl main
main:
la $a0, cadena_introduce #instruciones simples para imprimir la cadena introduce
li $v0, 4
syscall

li $v0, 12 #instrucciones simples para introducir por teclado el caracter
syscall
move $a0, $v0

jal isdigit #llamada a la funcion isdigit

beqz $v0, letra #como si es letra devuelve 0, pues salta a la funcion letra, si no, sigue adelante
la $a0, cadena_num  #instruciones simples para imprimir la cadena numero
li $v0, 4
syscall

j fin #salta a fin, porque si siguiera se imprimiria tambien la cadena de letra

letra:
la $a0, cadena_let  #instruciones simples para imprimir la cadena letra
li $v0, 4
syscall

fin:
li $v0, 10 #fin del programa
syscall

isdigit: #etiqueta de la funcion isdigit

blt $a0, 48, fin_isdigit #si el caracter esta comprendido entre el 48
bgt $a0, 57, fin_isdigit #y el 57 (0-9 en la tabla ascii)
li $v0, 1 #devuelve 1, si no, salta a fin_isdigit
j fin_atras

fin_isdigit:
li $v0, 0 #como es letra devuelve 0

fin_atras:
jr $ra #volver al main
