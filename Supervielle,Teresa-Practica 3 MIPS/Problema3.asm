.data
A: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
B: .word 16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

.text
.globl main
main:
li $s0, 3 #valor de f=3
li $s1, 6 #valor de g=6
li $s2, 5 #valor de h=5

#f = g - A[B[4]]
la $s6, A
la $s7, B

lw $t0, 12($s7)
lw $t0, B($t0)
sub $s0, $s1, $t0

#f = A[B[g] + 1]
lw $t0, B($s1)
addi $t0, $t0, 1
sw $s0, A($t0)

#f = A[g] - (B[g - 1] + B[g + 1])
subi $t0, $s1,1
addi $t1, $s1,1
lw $t0, B($t0)
lw $t1, B($t1)
add $t0, $t0, $t1
lw $t1, A($s1)
sub $s0, $t1, $t0