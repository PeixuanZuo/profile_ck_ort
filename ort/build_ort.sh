# !/bin/bash

THIS_DIR=$(realpath $(dirname $0))
CMAKE_DIR=${THIS_DIR}/cmake

# set environment
export CMAKE_VERSION=3.24.2
mkdir ${CMAKE_DIR} && cd ${CMAKE_DIR} && \
    wget -q -O - https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz | tar zxf -
export PATH=${CMAKE_DIR}/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}

pip install ninja

cd ${THIS_DIR}

git clone https://github.com/microsoft/onnxruntime.git -b peixuanzuo/gemmfastgelu_ck_2
cd onnxruntime
# use the ck commit d58b7f5155b44c8b608f3edc6a6eab314493ec1a
git checkout 936d65551f3e9e0fe425cb91e06031766d6eaa4e
git submodule update --init

# build ort with kernel explorer
./build.sh \
    --config Release \
    --enable_training \
    --enable_training_torch_interop \
    --mpi_home /opt/ompi \
    --cmake_generator Ninja \
    --cmake_extra_defines \
        CMAKE_HIP_COMPILER=/opt/rocm/llvm/bin/clang++ \
        onnxruntime_BUILD_KERNEL_EXPLORER=ON \
     --use_rocm \
    --rocm_version=5.3.2 \
    --rocm_home /opt/rocm \
    --nccl_home /opt/rocm \
    --update \
    --build_dir ./build \
    --build \
    --build_wheel \
    --skip_tests \
    --skip_submodule_sync \
    --parallel


