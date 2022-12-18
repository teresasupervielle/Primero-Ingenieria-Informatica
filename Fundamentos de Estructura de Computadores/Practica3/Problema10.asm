.data
A: .word 8,4,9,3,5,2,1,7,6,10
B: .word 9,3,5,10,7,8,6,1,4,2
C: .space 40

.text
main:

#Modificar el programa anterior: en lugar de un índice utilizar un puntero a A, otro a B y otro a C. A cada iteración se deberán incrementar los punteros en tantas unidades como sea necesario para apuntar al siguiente elemento.
li $t0, 0

bucle:
lw $a0, A($t0)
lw $a1, B($t0)

jal maximo

sw $a2, C($t0)

move $a0, $a2
li $v0, 1
syscall

addi $t0, $t0,4
blt $t0, 40, bucle

li $v0,10
syscall

maximo:

bge $a0, $a1, cambio
move $a2, $a1
j fin_max
	
cambio:
move $a2, $a0
	
fin_max:
jr $ra