#include <stdio.h>
#include <stdlib.h>

int recursividad (int *A, int n, int i, int cont, int min);

int main(){
	int A[6]={1,2,3,4,5,6}, n=6, i=0, cont=0, min=0;
	recursividad(A, n, i, cont, min);
	if(cont==n){
		printf("Esta ordenado correctamente");
	}else{
		printf ("NO esta ordenado correctamente");
	}
return 0;
}

int recursividad (int *A, int n, int i, int cont, int min){
	if (min<A[i] && i<n){
		min=A[i];
		return recursividad (A,n,i+1,cont+1, min);
	}else{
		return cont;
	}
}
