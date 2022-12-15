# !/bin/bash

THIS_DIR=$(realpath $(dirname $0))
cd ${THIS_DIR}/composable_kernel/build/bin

# no init
./ckProfiler gemm 1 0 1 0 0 1 49152 3072 768 768 3072 3072 2>&1|tee gemm_ck_zero_init.log

# integer value
./ckProfiler gemm 1 0 1 1 0 1 49152 3072 768 768 3072 3072 2>&1|tee gemm_ck_integer_init.log

# decimal value
./ckProfiler gemm 1 0 1 2 0 1 49152 3072 768 768 3072 3072 2>&1|tee gemm_ck_decimal_init.log
