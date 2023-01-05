# !/bin/bash

git clone https://github.com/ROCmSoftwarePlatform/composable_kernel.git
cd composable_kernel
git checkout 0345963eef4f92e9c5eab608bb8557b5463a1dcb

# change runing loop to 100
sed -i 's/const int nrepeat = 10;/const int nrepeat = 100;/g' ./include/ck/host_utility/kernel_launch.hpp

mkdir build
cd build
cmake \
-D CMAKE_PREFIX_PATH=/opt/rocm \
-D CMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc \
-D CMAKE_CXX_FLAGS="-O3" \
-D CMAKE_BUILD_TYPE=Release  \
-D GPU_TARGETS="gfx908;gfx90a" \
-D CMAKE_INSTALL_PREFIX=/usr/local ..

 make -j ckProfiler
