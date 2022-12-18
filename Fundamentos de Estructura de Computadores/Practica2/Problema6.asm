.data
valor: .word 10, 20, 30, 40
.text
.globl main
main:
move $t0,$zero # $t0=0 "indice"
move $t1,$zero # $t1=0 "suma"
li $t2,4 # $t2=4 constante
la $s0, valor # $s0=puntero a ‘valor’

bucle:
mul $t3, $t0, 4
add $t4,$s0,$t3

lw $s1,0($t4)
add $t1,$t1,$s1 # Suma el elemnto a la suma anterior
add $t0,$t0,1 # Incremento del indice
blt $t0,$t2,bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice<4)

move $a0,$t1
li $v0, 1
syscall 