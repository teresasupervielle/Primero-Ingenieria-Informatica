.data #inicializamos el vector
vector: .half 1, 2, 3, 4, 5, 5, 5, 5, 8, 8
cad_total: .asciiz "El numero total de repeticiones es: "
.text
.globl main
main:
li $t0, 0 #contador del iterador
li $v0, 0 #contador de las repeticiones

repeticiones:
sll $t1,$t0,1 #en t1, llevamos el iterador i del desplazamiento (1 porque es half)

lh $s0, vector($t1) #guardamos en s0 el valor de vector[i]
lh $s1, vector + 2($t1) #guardamos en s1 el valor de vector [i+1]
bne $s0, $s1, rep #si ambas son distintas salta a rep
addi $v0, $v0, 1 #como son iguales el contador se incrementa a 1

rep:
addi $t0,$t0,1  #contador del iterador + 1
blt $t0, 9, repeticiones #mientras que este contador sea menor que 9 salta a repeticiones

move $t2, $v0 #lo movemos a t2, ya que v0, obtendra ahora otro valor y se perderia
la $a0, cad_total #se imprime la cadena total
li $v0, 4
syscall

move $a0, $t2 #imprime las repeticiones
li $v0, 1
syscall

li $v0, 10 #se acaba el programa
syscall

