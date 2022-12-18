.data
A: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
B: .word 16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

.text
.globl main
main:
li $s2, 5 #valor de h=5

#A[12]=h+A[8]
lw $s3, A+28
add $t0, $s3, $s2
sw $t0, A+44