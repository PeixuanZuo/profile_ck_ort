this_dir=$(realpath $(dirname $0))

cd ${this_dir}/composable_kernel/build/bin

// no init
./ckProfiler gemm 1 0 1 0 0 1 49152 3072 768 768 3072 3072

// integer value
./ckProfiler gemm 1 0 1 1 0 1 49152 3072 768 768 3072 3072

// decimal value
./ckProfiler gemm 1 0 1 2 0 1 49152 3072 768 768 3072 3072
