#include <stdio.h>
#include <stdlib.h>

int main(){
	
	int A[]={2,3,4,5,6,7,8,9,10,11}, n = sizeof (A) / sizeof(int), i;
	
	llamada_rec(A, n);
	
	for (i=0; i<n; i++){
		printf ("%d,", A[i]);
	}
	
	return 0;
}


void fun_rec (int *A, int n, int i, int j){
	if(i<n){
		if (j<n){
			if (A[i]!=0 && A[j]%A[i]==0){
				A[j]=0;
			}
				return fun_rec(A, n, i, j+1);		
		}
	return fun_rec (A, n, i+1, i+2);
	}
}


void llamada_rec(int *A, int n){
	if (n<0)
		printf ("Error");
	else
		return fun_rec(A, n, 0, 1);
}
