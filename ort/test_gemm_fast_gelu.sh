this_dir=$(realpath $(dirname $0))
export KERNEL_EXPLORER_BUILD_DIR='${this_dir}/onnxruntime/build/Release/'

python ${this_dir}/onnxruntime/python/tools/kernel_explorer/kernels/gemm_fast_gelu_test.py N N float16 49152 3072 768 --sort

