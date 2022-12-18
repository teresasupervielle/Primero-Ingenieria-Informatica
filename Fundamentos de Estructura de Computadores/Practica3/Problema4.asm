.data
A: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
B: .word 16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

.text
.globl main
main:
li $s0, 3 #valor de f=3
li $s1, 6 #valor de g=6

#f = A[B[g] + 1]
lw $t0, B($s1)
addi $t0, $t0, 1
sw $s0, A($t0)