#include <device_launch_parameters.h>
#include <device_atomic_functions.h>
#include <stdio.h>
#include <stdlib.h>

__global__ void example_kernel(int example_input)
{
    __shared__ int test_atomics = 1;
    atomicAdd(&test_atomics, 1);
    printf("[%u, %u] hello from cuda; input was %d\n", blockIdx.x, threadIdx.x, example_input);
}

int main(int argc, char** argv)
{
    printf("warmup run\n");
    example_kernel<<<4, 4>>>(argc == 2 ? atoi(argv[1]) : 1);
    int output = 0;
    if(cudaError e = cudaStreamSynchronize(NULL))
    {
        printf("cuda error: %s\n", cudaGetErrorString(e));
        output = (int)e;
    }
    printf("no errors\n");
    fflush(stdout);
    return output;
}
