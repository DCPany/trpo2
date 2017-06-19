#include "funk.h"
#include <math.h>

int Proverka(float D)
{
	if (D == 0) {
		return 0;
	}
	if (D < 0) {
		return 1;
	}
	if (D > 0) {
		return 2;
	}
	return 0;
}

float Discriment(float a,float b, float c)
{
	float D = b*b - 4 * a * c;
	return D;
}

float Znachenie (float D, float a, float b, float c, int i)
{
	float x;
	x = ((-1)* b + D*D * i) / (2 * a);
	return x;
}
