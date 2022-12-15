git clone https://github.com/microsoft/onnxruntime.git -b peixuanzuo/gemmfastgelu_ck_2

cd onnxruntime
// use the ck commit d58b7f5155b44c8b608f3edc6a6eab314493ec1a
git checkout 40903e1069ca853e1501e4948318d705d8e9143e
git submodule update --init

//build ort with kernel explorer kernel
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
    --build_dir .build \
    --build \
    --build_wheel \
    --skip_tests \
    --skip_submodule_sync \
    --parallel


