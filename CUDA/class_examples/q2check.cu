#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <math.h>
#include <string.h>

int size_n, SEED;

#define CUDA_ERROR_EXIT(str) do{\
                                    cudaError err = cudaGetLastError();\
                                    if( err != cudaSuccess){\
                                             printf("Cuda Error: '%s' for %s\n", cudaGetErrorString(err), str);\
                                             exit(-1);\
                                    }\
                             }while(0);
#define TDIFF(start, end) ((end.tv_sec - start.tv_sec) * 1000000UL + (end.tv_usec - start.tv_usec))

__global__ void XOR_Sum(int *a, int sz) {
	int i = blockDim.x * blockIdx.x + threadIdx.x;
	int n = sz/2;

	while(n != 0) {
		if(i < n)
			a[i] = (a[i]^a[i+n]);
		__syncthreads();
		if(sz % 2 == 1) {
			a[n] = a[2*n];
			sz = n+1;
		}
		else
			sz = n;
		n = (sz/2);
	}
}


int main() {
	struct timeval start, end, t_start, t_end;
	int *arr, *gpu_arr; 
	int X_sum, blocks; // array whose xor we need to calculate
	
	scanf("%d", &size_n);

	/* Allocate host (CPU) memory and initialize*/
	arr = (int *)malloc(size_n * sizeof(int));
	if(!arr) {
		printf("Cannot declare required memory\n");
		exit(-1);
	}
	// srand(SEED); // srand sets the seed which is used for generating random numbers 

	for(int i = 0;i < size_n;i++)
		scanf("%d",&arr[i]);

	/* Allocate GPU memory and copy from CPU --> GPU*/
	cudaMalloc(&gpu_arr, size_n * sizeof(int));
	CUDA_ERROR_EXIT("cudaMalloc");

	cudaMemcpy(gpu_arr, arr, size_n * sizeof(int) , cudaMemcpyHostToDevice);
	CUDA_ERROR_EXIT("cudaMemcpy");
	
	blocks = (size_n / 2) / 1024;
	
	if((size_n / 2) % 1024)
	       ++blocks;

	XOR_Sum<<< blocks, 1024>>>(gpu_arr,size_n);
	cudaMemcpy(arr, gpu_arr, size_n * sizeof(int) , cudaMemcpyDeviceToHost);

	X_sum = arr[0];


	// gettimeofday(&t_start, NULL); // for total time

	// gettimeofday(&start, NULL); // when actual processing starts (call to global)

	// gettimeofday(&end, NULL);
	
	// gettimeofday(&t_end, NULL);

	// printf("Total time = %ld microsecs Processsing =%ld microsecs\n", TDIFF(t_start, t_end), TDIFF(start, end));


	printf("XOR Sum: %d\n", X_sum);

	return 0;
}