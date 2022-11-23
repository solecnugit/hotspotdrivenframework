#include <iostream>
#include <cstdlib>
using namespace std;
#define LENGTH 18096 
void swap(int array[], int i, int j)
{
	int temp = array[i];
	array[i] = array[j];
	array[j] = temp;
}
void BubbleSort(int array[], int n)
{
	for (int i = 0; i < n-1; i++)
	{
		for (int j = i + 1; j < n-1; j++)
		{
			if (array[i]>array[j])
				swap(array, j, i);
		}
	}
}
void GenerateArray(int* myarray){
	for (int i = 0; i < LENGTH; i++)
	{
		myarray[i]=rand();
	}
}

long int SumArray(int * arr){
    long int sums=0;
    for (int i = 0; i < LENGTH; i++)
    {
        sums+=arr[i];
    }
    return sums;
}

int main()
{
	int arr[LENGTH];
    cout<<"Input array length:"<<LENGTH<<endl;
    GenerateArray(arr);
    cout<<"Sorting......"<<endl;
	BubbleSort(arr, LENGTH);
    long int sums=SumArray(arr);
    cout<<"The result of summing the array:"<<sums<<endl;
    return 0;
}