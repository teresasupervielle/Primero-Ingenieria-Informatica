.data
valor: .half 10, 20, 30, 40
texto: .asciiz "La suma es:"
suma: .space 2
.text
.globl main
main:
move $t0,$zero # $t0<-- "indice" con valor inicial 0
move $t1,$zero # $t1<-- "suma" con valor inicial 0
li $t2,4 # $t2<-- constante
la $t4, suma

bucle:
sll $t3,$t0,1

lh $s1,valor($t3)
add $t1,$t1,$s1
add $t0,$t0,1
blt $t0,$t2,bucle

sh $t1,0($t4)

la $a0, texto
li $v0, 4
syscall

move $a0,$t1
li $v0, 1
syscall 
