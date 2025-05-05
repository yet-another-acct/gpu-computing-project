warmup/hello_cuda: nvcc_flags src/util.h warmup/hello_cuda.cu
	nvcc $(shell cat nvcc_flags) warmup/hello_cuda.cu -o warmup/hello_cuda
