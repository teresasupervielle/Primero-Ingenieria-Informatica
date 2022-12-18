.data

.text
.globl main
main:

#int i=1;
#int j=0;
#int N=0;
#while(i <= N){
#j = j + i;
#i++;
#};

li $s0, 1 #i
li $s1, 0 #j
li $s2, 0 #N

while:
blt $s2, $s0, fin_while
add $s1, $s1, $s0
addi $s0,$s0, 1

j while
fin_while: