#include <stdio.h>
#include <stdlib.h>

int main(){
	int A[]={1, 2, 3, 3, 3, 1, 2, 4, 3}, n;
	
	n = sizeof(A) / sizeof(int);
	
	printf("Los cambios de tendencias son: %d", tendencia(A, n));

return 0;
}

//PRECONDICION: A, n, i, tendencia y contador, ya inicializados
//CABECERA: almacena -1 si la tendencia es decreciente y 1 si es creciente, ademas cuando cambia de tendencia se incrementa el contador, que se mantenga el mismo numero, no cuenta como cambio de tendencia
//POSTCONDICION: devuelve el numero de los cambios de tendencia

int tendencia_rec(int *A, int n, int i, int tendencia, int cont){
	if(i==n-1){ //cuando i sea n-1, devuelve el contador
		return cont;
	}else{ 
		if(tendencia <= 0 && A[i] < A[i+1]) //si el primero es menor o igual que el segundo, la tendencia es creciente; y si la tendencia es menor o igual a 1, habria un cambio de tendencia
			return tendencia_rec(A, n, i+1, 1, cont+1);
		else{
			if(tendencia >= 0 && A[i] > A[i+1]) //si el primero es mayor o igual que el segundo, la tendencia es decreciente; y si la tendencia es mayor o igual a 1, habria un cambio de tendencia
				return tendencia_rec(A, n, i+1, -1, cont+1);
			else
				return tendencia_rec(A, n, i+1, tendencia, cont); //si ambas parejas son iguales se mantiene la tendencia y el contador igual
		}
	}
}

//PRECONDICION: A y n ya inicializados
//CABECERA: llama a la funcion recursiva si el vector es mayor que 0
//POSTCONDICION: devuelve el numero de los cambios de tendencia

int tendencia(int *A, int n){
	if(n<=0) //si el tamaño del vector es menor que 0, no es posible seguir con el programa
		printf ("ERROR");
	else
		return tendencia_rec(A, n, 0, 0, 0); //i=0 poruqe es el iterador de las posiciones del vector; tendencia=0, porque al comienzo de vector no hay ninguna tendencia; cont=0, para asegurar que no tienen residuos
}
