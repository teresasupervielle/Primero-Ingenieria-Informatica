#include <stdio.h>
#include <stdlib.h>

int main(){
	
	int A[10]={2, 2, 3, 3, 4, 4, 4, 4, 6, 6}, n=10;
		
	printf ("%d", moda (A, n));

return 0;
}

//CABECERA:int rec_moda (int *A, int n, int i, int cont, int max, int moda)
//PRECONDICION: Vector A y longitud n del vector ya inicializado
//POSTCONDICION: Devolver la moda del vector

int rec_moda (int *A, int n, int i, int cont, int max, int moda){
	if (i == n){
		return moda;
	} else {
		if (A[i] == A[i+1] && i != (n-1)){
			return rec_moda (A, n, i+1, cont+1, max, moda);
		}else{
			if (cont > max){
				return rec_moda(A, n, i+1, 0, cont, A[i]);
			} else {
				return rec_moda(A, n, i+1, 0, max, moda);
			}
		}
	}	
}

//CABECERA:int moda (int *A, int n)
//PRECONDICION: Vector A y longitud n del vector ya inicializado
//POSTCONDICION: Devolver la moda del vector

int moda (int *A, int n){
	return rec_moda(A, n, 0, 0, 0 ,0);
}
