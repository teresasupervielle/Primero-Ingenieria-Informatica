#include <stdio.h>
#include <stdlib.h>
#define N 10

int moda_rec (int v[N], int, int, int, int);
int moda (int v[N]);

int main(){
	int v[N]={1,2,2,3,4,5,5,5,6,7};
	printf ("La moda es %d", moda (v));
	return 0;
}

int moda_rec (int v[N], int i, int max, int elem, int cont){
	if (i<N){
		if (v[i-1]==v[i]){
			elem=v[i];
			cont++;
		}
	if (cont>max)
	max=cont;
	moda_rec (v, i+1, max, elem, cont);
	}
	if (i==N)
	return elem;
}


int moda (int v[N]){
	return moda_rec(v,1,0,0,0);
}
