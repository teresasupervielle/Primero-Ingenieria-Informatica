.data #inicializacion de las dos cadenas iniciales, y reservamos el espacio para la cadena concatenada
orig: .asciiz "Bien"
dest: .asciiz "Holacomoestas"
cat: .space 400
cadena_cat: .asciiz "Cadena concatenada:"

.text
.globl main
main:
li $t0, 0 #iterador i = 0 (que recorrera la cadena destino y la cat, ya que origen se copiara a continuacion de la de destino)
li $t1, 0 #iterador j=0 (que recorrera la cadena origen para copiarla en cat)

jal strcat #salta a la funcion strcat

la $a0, cadena_cat #instrucciones simples para imprimir la cadena cadena_cat
li $v0, 4
syscall

la $a0, cat #instrucciones simples para imprimir la cadena cat
li $v0, 4
syscall

li $v0, 10 #fin del programa
syscall

strcat: #etiqueta de la funcion strcat
lb $s0, dest($t0) #almacenamos en s0 el caracter dest[i]
beqz $s0, origen #si es el final de la cadena, salta a origen
sb $s0, cat($t0) #alamcenamos en cat[i], el caracter que hay en s0

addi $t0, $t0, 1 #i++
j strcat #saltamos a strcat

origen: #etiqueta de la funcion origen
lb $s1, orig($t1) #almacenamos en s1 el caracter orig[j]
beqz $s1, fin_strcat #si es el final de la cadena, salta a fin_strcat
sb $s1, cat($t0) #alamcenamos en cat[j], el caracter que hay en s1

addi $t1, $t1, 1 #j++
addi $t0, $t0, 1 #i++
j origen

fin_strcat:
jr $ra #volvemos al main
