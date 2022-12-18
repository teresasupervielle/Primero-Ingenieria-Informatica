.data
valor: .word 10, 20, 30, 40
texto: .asciiz "La suma es:"
.text
.globl main
main:
move $t0,$zero # $t0<-- "indice" con valor inicial 0
move $t1,$zero # $t1<-- "suma" con valor inicial 0
li $t2,4 # $t2<-- constante

bucle:
sll $t3,$t0,2

lw $s1,valor($t3) # Carga del elemento referenciado por la dirección
add $t1,$t1,$s1 # Suma el elemnto a la suma anterior
add $t0,$t0,1 # Incremento del indice
blt $t0,$t2,bucle

la $a0, texto
li $v0, 4
syscall

move $a0,$t1
li $v0, 1
syscall 