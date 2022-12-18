#include <stdio.h>
#include <stdlib.h>

int main(){
	int A[]={2,4,6,4}, B[]={7,9,2,2}, na, nb;
	na = sizeof (A) / sizeof(int);
	nb = sizeof (B) / sizeof(int);
	
	printf ("El producto escalar es: %d", escalar(A, B, na, nb));

return 0;
}

//CABECERA: int rec_escalar(int *A, int *B, int n, int i, int prod)
//PRECONDICION: Todas las varibles ya inicializadas
//POSTCONDICION: Devuelve el producto escalar de dos vectores

int rec_escalar(int *A, int *B, int na, int i, int prod){
	if(i==na){
		return prod;
	}else{
		return rec_escalar(A, B, na, i+1, (prod+A[i]*B[i])); //Devuelve a prod, la suma d este con la multiplicacion de ambos elementos del vector
	}
}

//CABECERA: int escalar(int *A, int *B, int na, int nb)
//PRECONDICION: Todas las varibles ya inicializadas
//POSTCONDICION: Devuelve el producto escalar de dos vectores

int escalar(int *A, int *B, int na, int nb){
	if (na!=nb)
		printf ("ERROR");
	else
		return rec_escalar(A, B, na, 0, 0);
}
