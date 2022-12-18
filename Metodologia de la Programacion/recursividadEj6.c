#include <stdio.h>
#include <stdlib.h>

int main(){
	
	int A[10]={2, 1, 2, 0, 4, 5, 4, 4, 6, 6}, n;
	n = sizeof (A) / sizeof(int);
	
	if (suma (A, n) == -1)
		printf ("Si hay suma");
	else
		printf ("No hay una suma");
		

return 0;
}

//CABECERA: int rec_suma(int *A, int n, int i, int cont)
//PRECONDICION: Todas las varibles ya inicializadas
//POSTCONDICION: Devuelve -1 si hubiese una suma iguales entre dos parejas; y distinto de -1 si no hay suma

int rec_suma(int *A, int n, int i, int cont){
	if (i==n){
		return cont;
	}else{
		if (A[i]+A[i+1] == A[i+2]+A[i+3] && i != (n-1)){ //Compara si las sumas de ambas parejas consecutivas es igual
			return -1;
		} else{
			return rec_suma (A, n, i+1, 0);
		}
	}	
}

//CABECERA: int rec_escalera (int *A, int n, int i, int esc, int max)
//PRECONDICION: Todas las varibles ya inicializadas
//POSTCONDICION: Devuelve -1 si hubiese una suma iguales entre dos parejas; y distinto de -1 si no hay suma

int suma(int *A, int n){
	if (n<=1)
		printf ("ERROR");
	else
		return rec_suma(A, n, 0, 0);	
}
