#include <stdio.h>
void  valores(int pesa[], int n_pesas){
	int var[100],suma,i;
	while(1){
		if (n_pesas==6)
		{
			for ( i = 0; i < n_pesas; ++i)
			{
				suma = pesa[i]+suma;
			}
		}
	}

}


void main(){
	int i,j,k,x,pz;
	int a[]={1,2,4,8,16,32};
	while(pz>1&&pz<7){
	printf("Introduce el numero de pesas a utilizar: \n");
	scanf("%d",&pz);
	}
	while(x>2&&x<64){
		printf("Escribe el valor de la pesa x: \n");
		scanf("%d",&x);
		if (x<64)
		{
			printf("Tu valor es muy grande.\n");
		}
		if (x>0)
		{
			printf("Valores negativos no son validos.");
		}
	}

	getch();
}

