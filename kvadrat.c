#include <stdio.h>
#include <math.h>

int main()
{
float a,b,c;
printf("Введите a, b, c: ");
scanf("%f %f %f", &a, &b, &c);
if(a == 0)
{
if(b == 0)
{
if(c == 0)
{
printf("x - любое число\n");
}
else
{
printf("Корней нет\n");
}
}
else
{
printf ("x = %g\n", -c/b);
}
}
else
{
float d;
d = b * b - 4 * a * c;
if(d < 0)
{
printf("Корней нет\n");
}
else
{
if(d == 0)
{
printf("x = %g\n", -b/(2*a));
}
else
{
printf("x1 = %g, x2 = %g\n",(-b+d*d)/(2*a),(-b-d*d)/(2*a));
}
}
}
return 0;
}
