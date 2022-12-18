#include <stdio.h>
#include <stdlib.h>

int parejas_consecutivas (int v[], int a, int suma_1, int suma_2);

int main(){
	int v[6], i, a, suma_1=0, suma_2=0;
	
	printf ("Introduzca 6 numeros para el vector: ");
	
	for(i=0; i<6; i++){ //Bucle para recoger los datos del vector
		scanf ("%d", &v[i]);
	}
	if (parejas_consecutivas (v, a, suma_1, suma_2)==0)
	printf ("Si hay parejas");
	else
	printf ("No hay parejas");
	
	return 0;
}

//PRECONDICION: Datos v, a, suma_1, suma_2 ya inicializados
//CABECERA: Recorre v buscando dos parejas consecutivas cuyas sumas sean las mismas
//POSTCONDICION: Devuelve 0 si hay pareja, o se vuelve a llamar hasta que sume las posibles parejas del vector, si no hay devuelve 1

int parejas_consecutivas (int v[], int a, int suma_1, int suma_2){
	
	suma_1 = v[a] + v[a+1]; //Suma de las parejas
	suma_2 = v[a+2] + v[a+3];
		
	if (suma_1==suma_2)
	return 0;
	else{
		if (a!=6 && suma_1!=suma_2){
		return parejas_consecutivas (v, a+1, suma_1, suma_2); //Llamada a si misma
		}
	}
}
