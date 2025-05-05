warmup/hello_cuda: nvcc_flags warmup/hello_cuda.cu
	nvcc $(shell cat nvcc_flags) warmup/hello_cuda.cu -o warmup/hello_cuda

.PHONY: warmup_run
warmup_run: warmup/hello_cuda
	./warmup/hello_cuda
