#include <stdio.h>
#include <stdlib.h>

void mym (int v[], int pos, int min, int max);

int main(){
	
	int v[]={1,2,3,4,5,6,7,8}, pos=8, min=0, max=0;
	
	mym (v, pos, min, max);
	
	return 0;
}

void mym (int v[], int pos, int min, int max){
	
	if (pos==-1){
		printf ("El minimo es %d y el maximo es %d", min, max);
	}
	else{
		if(v[pos]<min)
		min=v[pos];
		if(v[pos]>max)
		max=v[pos];
		
		return mym (v, pos-1, min, max);
	}
}
