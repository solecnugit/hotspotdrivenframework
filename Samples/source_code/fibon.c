#include<stdio.h>
int Fibon(int n)
{
   if (n == 1|| n == 2)
   {
	   return 1;
   }
   else
   {
	   return Fibon(n-1)+ Fibon(n-2);
   }
}
int main()
{
	for (int i = 1; i <= 15; i++)
	{
		printf("%d ", Fibon(i));
	}
	printf("\n");
	return 0;
}
