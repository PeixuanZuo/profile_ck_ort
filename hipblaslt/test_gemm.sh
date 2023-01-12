# !/bin/bash

cd hipBLASLt
cd build/release

./clients/staging/hipblaslt-bench \
--transA N \
--transB N \
-m 49152 \
-n 3072 \
-k 768 \
--alpha 1 \
--lda 49152 \
--stride_a 0 \
--beta 0 \
--ldb 768 \
--stride_b 0 \
--ldc 49152 \
--stride_c 0 \
--ldd 49152 \
--stride_d 0 \
--bias_type f16_r \
--precision f16_r \
--iters 100 \
--cold_iters 4 \
--initialization hpl \
--activation_type none

# the result
# transA,transB,M,N,K,alpha,lda,stride_a,beta,ldb,stride_b,ldc,stride_c,ldd,stride_d,d_type,compute_type,activation_type,bias_vector,hipblaslt-Gflops,us
# N,N,49152,3072,768,1,49152,37748736,0,768,2359296,49152,150994944,49152,150994944,f16_r,f32_r,none,0, 130591, 1775.99