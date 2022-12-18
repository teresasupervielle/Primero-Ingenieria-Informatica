.data
A: .word 8,4,9,3,5,2,1,7,6,10
B: .word 9,3,5,10,7,8,6,1,4,2
C: .space 40

.text
main:

#Para i desde 1 hasta 10: C[i] = max(A[i], B[i])
li $t0, 0

bucle:
sll $t1, $t0, 2
lw $a0, A($t1)
lw $a1, B($t1)

jal maximo

sw $a2, C($t1)

move $a0, $a2
li $v0, 1
syscall

addi $t0, $t0,1
blt $t0, 10, bucle

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
