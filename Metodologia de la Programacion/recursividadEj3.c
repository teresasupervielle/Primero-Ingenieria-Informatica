#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
	
	int i=7, cont=0, n=53678902, res=0;
	
	res = rec_iesima(n, i, cont);
	
	printf ("%d", res);

return 0;
}
