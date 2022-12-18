#include <stdio.h>
#include <stdlib.h>

int main(){
	int A[]={1,2,4,6,7,8,9,10,11}, n;
	n = sizeof (A) / sizeof(int);
	printf ("La longitud es: %d", escalera(A, n));

return 0;
}

//CABECERA: int rec_escalera (int *A, int n, int i, int esc, int max)
//PRECONDICION: Todas las varibles ya inicializadas
//POSTCONDICION: Devuelve la longitud de la escalera mas larga

int rec_escalera (int *A, int n, int i, int esc, int max){
	if (i==n){
		return max;
	}else{
		if (A[i+1] == A[i]+1 && i != (n-1)){ //Compara el siguiente elemento del vector, con la suma d 1 del elemento en el que estemos (ej. 2=1+1)
			if (max < esc)
				return rec_escalera (A, n, i+1, esc+1, esc+1);
			else
				return rec_escalera (A, n, i+1, esc+1, max+1);
		}else
			return rec_escalera (A, n, i+1, 0, max);
	}
}

//CABECERA: int escalera(int *A, int n)
//PRECONDICION: Todas las variables ya inicializada
//POSTCONDICION: Devuelve la longitud de la escalera mas larga

int escalera(int *A, int n){
	if (n<=1)
		printf("ERROR");
	else
		return rec_escalera(A, n, 0, 0, 0);
}
