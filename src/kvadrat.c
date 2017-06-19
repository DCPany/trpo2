#include "funk.h"
#include <stdio.h>
#include <math.h>

int main ()
{
	int i;
	float x,D,a,b,c;
	printf("a*(x*x)+b*x+c=0\n");
	printf ("a = ");
	scanf("%f",&a);
	printf("b = ");
	scanf("%f",&b);
	printf("c = ");
	scanf("%f",&c);
	D = Discriment(a,b,c);
	i = Proverka(D);
	switch (i) {
		case 0:
			x = Znachenie (D, a, b, c, 1);
			printf ("x = %.2f\n",x);
			break;
		case 1:
			printf("Has no roots\n");
			break;
		case 2:
			x = Znachenie (D, a, b, c, 1);
			printf ("x1 = %.2f\n",x);
			x = Znachenie (D, a, b, c, -1);
			printf ("x2 = %.2f\n",x);
			break;
	}
	return 0;
}
