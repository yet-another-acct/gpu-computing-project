#include <device_launch_parameters.h>
#include <stdio.h>

__global__ void example_kernel(int example_input)
{
    printf("[%u, %u] hello from cuda; input was %d\n", blockIdx.x, threadIdx.x, example_input);
}

int main(int argc, char** argv)
{
    printf("warmup run\n");
    example_kernel<<<4, 4>>>(1);
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
