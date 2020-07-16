#include <iostream>
#include <complex>
#include <random>

#define MAX 200

using namespace std;

#define M_PI 3.1415926535897932384

int log2(int N)    /*function to calculate the log2(.) of int numbers*/
{
	int k = N, i = 0;
	while (k) {
		k >>= 1;
		i++;
	}
	return i - 1;
}

int check(int n)    //checking if the number of element is a power of 2
{
	return n > 0 && (n & (n - 1)) == 0;
}

int reverse(int N, int n)    //calculating revers number
{
	int j, p = 0;
	for (j = 1; j <= log2(N); j++) {
		if (n & (1 << (log2(N) - j)))
			p |= 1 << (j - 1);
	}
	return p;
}

void ordina(complex<double>* f1, int N) //using the reverse order in the array
{
	complex<double> f2[MAX];
	for (int i = 0; i < N; i++)
		f2[i] = f1[reverse(N, i)];
	for (int j = 0; j < N; j++)
		f1[j] = f2[j];
}

void Up_sampling(int *input, int in_size, int *output,int sample_rate)
{
	int new_size = (in_size * sample_rate)+(in_size % 2);
	for (int i = 0; i < new_size; i++)
	{		
		if ((i % sample_rate) == 0)
		{
			output[i] = input[i / sample_rate];
		}
		else
			output[i] = 0;
	}
}
void Down_sampling(int *input, int in_size, int *output, int sample_rate)
{
	int new_size = (in_size / sample_rate)+ (in_size % 2);
	for (int i = 0; i < new_size; i++)
	{
		output[i] = input[i * sample_rate];
	}
}

int main()
{
	random_device rd;
	mt19937 mt(rd());
	uniform_int_distribution<int> dist(-5, 5);
	int arr[5];
	for (int i = 0; i < 5; i++)
	{
		arr[i] = dist(mt);
		cout << arr[i] << " ";
	}
	cout << endl;
	int arr_up[8];

	Up_sampling(arr, 5, arr_up, 2);
	for (int i = 0; i < 10; i++)
	{
		cout<< arr_up[i] << " ";
	}
	cout << endl;
	Down_sampling(arr_up, 10, arr, 2);

	for (int i = 0; i <5; i++)
	{
		cout << arr[i] << " ";
	}
	cout << endl;
	while (1);
	return 0;
}