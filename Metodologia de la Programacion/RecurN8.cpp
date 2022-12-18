#include <stdio.h>
#include <stdlib.h>

int cambio_tendencia_rec(int n, int *v, int i, int cont, int tendencia);

int main () {
	int n=6, v[]={4,3,2,2,3,4}, i=0, cont=0, tendencia=0;

	printf ("El numero de cambios de tendencia es: %d", cambio_tendencia_rec (n, v, i+1, cont, tendencia));

	return 0;
}

//PRECONDICION: n, v, i, cont y tendencia ya inicializados
//CABECERA: guarda -1 en tendencia si es decreciente, y 1 si es creciente; si luego cambia la tendencia, cambian los numeros y se suma el contador
//POSTCONDICION: devuelve el numero de los cambios de tendencia

int cambio_tendencia_rec (int n, int *v, int i, int cont, int tendencia){
	if(i==n-1){
		return cont;
	} else{
		if(tendencia==0 && v[i]!=v[i+1]){ 
			if(v[i]<v[i+1]) //si el primero es menor que el segundo, la tendencia es creciente
				tendencia=1;
			else{ //si no, es decreciente
				tendencia=-1;
			}
		}else{
			if(tendencia==1 && v[i]>v[i+1]){ //si es creciente y el 1º es mayor al 2º, cambia la tendencia y suma 1 al contador
				cont++;
				tendencia=-1;
			}
			if(tendencia==-1 && v[i]<v[i+1]){ //si es decreciente y el 1º es menor al 2º, cambia la tendencia y suma 1 al contador
					cont++;
					tendencia=1;
			}
		}
	}
	return cambio_tendencia_rec(n, v, i+1, cont, tendencia);//devuelve la recursividad
}



