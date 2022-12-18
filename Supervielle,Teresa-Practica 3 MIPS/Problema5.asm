.data

.text
.globl main
main:

#int i=1;
#int j=0;
#int N=1000;
#do{
#j = j + i;
#i++;
#}while(i <= N);

li $s0, 1 #i
li $s1, 0 #j
li $s2, 1000 #N

move $a0, $s0
li $v0, 1
syscall

do:
add $s1, $s1, $s0
addi $s0,$s0, 1

blt $s2, $s0, fin_do
j do

fin_do:
move $a0, $s0
li $v0, 1
syscall