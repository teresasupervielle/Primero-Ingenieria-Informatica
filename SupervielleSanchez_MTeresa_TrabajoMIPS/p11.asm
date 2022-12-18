.data #cadenas informativas
cad_inicial: .asciiz "Vector inicial: "
cad_coma: .asciiz ", "
cad_final: .asciiz "\nVector final: "
vector: .word 2, 3, 4, 1, 5, 6, 7, 3, 4, 5

.text
.globl main
main:
li $t0, 0 #iterador que recorre el vector

la $a0, cad_inicial #se imprime la cadena inicial
li $v0, 4
syscall

for_1: #tanto for_1 como for_2 son bucles que recorren e imprime el vector, por lo tanto no les voy a dar importancia
sll $t1, $t0, 2
bgt $t0, 9, seguir_1

lw $a0, vector($t1)
li $v0, 1
syscall

la $a0, cad_coma
li $v0, 4
syscall

addi $t0, $t0, 1

j for_1

seguir_1:

jal bsort #saltamos a la funcion bsort

li $t0, 0 #volvemos a poner el iterador a 0

la $a0, cad_final
li $v0, 4
syscall

for_2:
sll $t1, $t0, 2
bgt $t0, 9, seguir_2

lw $a0, vector($t1)
li $v0, 1
syscall

la $a0, cad_coma
li $v0, 4
syscall

addi $t0, $t0, 1

j for_2

seguir_2: #se acaba el programa
li $v0, 10
syscall

bsort: #etiqueta de la funcion bsort
li $t1, 10 #tamaño
li $t2, 1 #i
li $t3, 0 #j

for_bsort1: #este es el bucle exterior que recorre el vector 
bgt $t2, $t1, fin_for1 #hasta que el t2 supere el tamaño del vector
sub $t4, $t1, $t2 #almacenamos en t4 la resta del tamaño - i

for_bsort2: #este es el bucle interno que recorre el vector
sll $t5, $t3, 2 #t5 es el iterador que nos indique la posicion del vector
bge $t3, $t4, fin_for2 # j > tamaño - i
lw $s0, vector($t5) #almacenamos en s0, la posicion vector[t5]
lw $s1, vector + 4($t5) #almacenamos en s1, la posicion vector[t5+1]

blt $s0, $s1, fin_if #comparamos ambos si s0 > s1, continua, si no, salta a fin_if
move $t6, $s0 #aux = vector[t5]
move $s0, $s1 #vector[t5] = vector[t5 + 1]
move $s1, $t6 #vector[t5 + 1] = aux
sw $s0, vector($t5) #almacenamos a vector[t5] el nuevo valor de s0
sw $s1, vector + 4($t5) #almacenamos a vector[t5 + 1] el nuevo valor de s1

fin_if:
addi $t3, $t3, 1 #j++
j for_bsort2

fin_for2:
li $t3, 0 #volvemos a poner j =0
addi $t2, $t2, 1 #i++
j for_bsort1

fin_for1:
jr $ra #vuelta a main
