#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
	
	int i=5, n=53678902;
		
	printf ("%d", iesima(n, i));

return 0;
}

int rec_iesima(int n, int i, int cont){
	if (cont == i){
		return n%10;
	} else {
		return rec_iesima(n/10, i, cont+1);
	}	
}

int iesima (int n, int i){
	return rec_iesima (n, i, 0);
}
