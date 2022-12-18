.data #inicializamos el vector
vector: .half 1, 2, 3, 4, 5, 5, 5, 5, 8, 8
cad_total: .asciiz "El numero total de repeticiones es: "
.text
.globl main
main:
li $t0, 0 #contador del iterador
la $s0, vector #almacenamos en s0 la direccion de memoria del vector

move $a0, $s0

jal repeticiones #salta a repeticiones

move $t2, $v0 #lo movemos a t2, ya que v0, obtendra ahora otro valor y se perderia
la $a0, cad_total #se imprime la cadena total
li $v0, 4
syscall

move $a0, $t2 #imprime las repeticiones
li $v0, 1
syscall

li $v0, 10 #fin del programa
syscall

repeticiones:
addi $sp, $sp, -4 #PUSH
sw $s0, 0($sp)

inicio:
sll $t1,$t0,1 #en t1, llevamos el iterador i del desplazamiento (1 porque es half)

lh $s0, vector($t1) #a partir de aqui, funciona como el programa anterior
lh $s1, vector + 2($t1)
bne $s0, $s1, rep
addi $v0, $v0, 1

rep:
addi $t0,$t0,1 
blt $t0, 9, inicio

lw $s0, 0($sp) #POP
addi $sp, $sp, +4

jr $ra #vuelve al main