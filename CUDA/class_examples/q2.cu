#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <math.h>
#include <string.h>

int size_n;
unsigned int SEED;

#define CUDA_ERROR_EXIT(str) do{\
                                    cudaError err = cudaGetLastError();\
                                    if( err != cudaSuccess){\
                                             printf("Cuda Error: '%s' for %s\n", cudaGetErrorString(err), str);\
                                             exit(-1);\
                                    }\
                             }while(0);
#define TDIFF(start, end) ((end.tv_sec - start.tv_sec) * 1000000UL + (end.tv_usec - start.tv_usec))

__global__ void XOR_Sum(int *a, int sz) {
	long long int i = (blockDim.x * blockIdx.x) + threadIdx.x;
	int n = sz/2;
	if(i >= n)
		return;
	a[i] = (a[i] ^ a[i+n]);
	if(sz %2 == 1)
		a[n] = a[2*n];
}


int main(int argc, char **argv) {
	struct timeval start, end, t_start, t_end;
	int *arr, *gpu_arr; 
	int X_sum, blocks; // array whose xor we need to calculate
	
	if(argc != 3) {
		printf("Invalid arguments!!\n");
		exit(-1);
	}
	else {
		size_n = atoi(argv[1]);
		SEED = atoi(argv[2]);
		if(size_n <= 0) {
			printf("Invalid value of number of terms!\n");
			exit(-1);
		}
	}

	/* Allocate host (CPU) memory and initialize*/
	arr = (int *)malloc(size_n * sizeof(int));
	if(!arr) {
		printf("Cannot declare required memory\n");
		exit(-1);
	}
	srand(SEED); // srand sets the seed which is used for generating random numbers 

	for(int i = 0;i < size_n;i++)
		arr[i] = rand();

	int sum = 0;
	for(int i = 0;i < size_n;i++)
		sum = (sum ^ arr[i]);
	printf("Sequential XOR: %d\n",sum);
	gettimeofday(&t_start, NULL); // for total time

	/* Allocate GPU memory and copy from CPU --> GPU*/
	cudaMalloc(&gpu_arr, size_n * sizeof(int));
	CUDA_ERROR_EXIT("cudaMalloc");

	cudaMemcpy(gpu_arr, arr, size_n * sizeof(int) , cudaMemcpyHostToDevice);
	CUDA_ERROR_EXIT("cudaMemcpy");
	
	gettimeofday(&start, NULL); // when actual processing starts (call to global)

	blocks = (size_n / 2) / 1024;
	
	if((size_n / 2) % 1024)
	       ++blocks;

	int sz = size_n, nn = sz/2;

	while(nn != 0) {
		XOR_Sum<<<blocks, 1024>>> (gpu_arr, sz);
		if(sz%2 == 1) 
			sz = nn + 1;
		else
			sz = nn;
		nn = sz/2;

	}

	gettimeofday(&end, NULL);

	cudaMemcpy(arr, gpu_arr, sizeof(int) , cudaMemcpyDeviceToHost);
	gettimeofday(&t_end, NULL);

	X_sum = arr[0];
	printf("Total time = %ld microsecs Processsing =%ld microsecs\n", TDIFF(t_start, t_end), TDIFF(start, end));


	cudaFree(gpu_arr);

	printf("XOR Sum: %d\n", X_sum);

	return 0;
}