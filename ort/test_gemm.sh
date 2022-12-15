# !/bin/bash

THIS_DIR=$(realpath $(dirname $0))
export KERNEL_EXPLORER_BUILD_DIR="${THIS_DIR}/onnxruntime/build/Release/"

python ${THIS_DIR}/onnxruntime/onnxruntime/python/tools/kernel_explorer/kernels/gemm_test.py N N float16 49152 3072 768

#change the init method
# ${onnxruntime-src}/onnxruntime/python/tools/kernel_explorer/kernels/gemm_test.py 119~120
# zero init
# a = np.zeros_like(a)
# b = np.zeros_like(b)
# integer init
# a = np.ceil(a)
# b = np.ceil(b)
