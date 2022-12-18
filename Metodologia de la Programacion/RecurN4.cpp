#include <stdio.h>
#include <stdlib.h>

int producto_escalar (int v_1[], int v_2[], int suma, int i);

int main(){
	int v_1[]={1,2,3};
	int v_2[]={4,5,6};
	int suma=0, i=0;
	
	printf ("El producto escalar es %d", producto_escalar (v_1, v_2, suma, i));
	
	return 0;
}

int producto_escalar (int v_1[], int v_2[], int suma, int i){
	
	if (i==3)
	return suma;
	else{
		suma = suma + v_1[i]*v_2[i];
		return producto_escalar(v_1, v_2, suma, i+1);
	}
}
