#include <stdio.h>
#include <stdlib.h>

int main(){
	int A[]={3, 5, 2, 7, 8, 9, 6, 7, 2, 1}, n;
	
	n = sizeof (A) / sizeof(int);
	
	printf ("La suma es: %d ", formSuma(A, n));
	
return 0;	
}

int rec_formSuma (int *A, int n, int i, int suma){
	if (i > (n/2)-1){
		return suma;
	}else{
		if (i == 0){
			if(A[i]>A[1] && A[i]>A[2])
				rec_formSuma (A, n, i+1, suma+A[i]);
		}else{
		if (A[i]>A[2*i] && A[i]>A[2*i+1])
			rec_formSuma (A, n, i+1, suma+A[i]);
		else				
			rec_formSuma (A, n, i+1, suma);
		}
	}
}

int formSuma (int *A, int n){
	if (n<0)
		printf ("ERROR");
	else
		rec_formSuma (A, n, 0, 0);
}
