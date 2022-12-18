#include <stdio.h>
#include <stdlib.h>

int iesima (int n, int i, int modulo, int selec);

int main(){
	
	int i=0, n=2608, modulo, selec, num=n;
	
	printf ("Eliga cifra del numero %d que quieres obtener:", n);
	scanf ("%d", &selec);
	
	printf ("La cifra %d de %d es: %d", selec, num, iesima(n,i,modulo,selec));
	
	return 0;
	
}

int iesima (int n, int i, int modulo, int selec){
	
	if (i==selec)
	return modulo;
	
	else
	modulo=n%10;
	return iesima (n/10, i+1, modulo, selec);
}
