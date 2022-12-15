FROM rocm/pytorch:rocm5.3.2_ubuntu20.04_py3.7_pytorch_1.12.1
# CMake
ENV CMAKE_VERSION=3.24.2
RUN cd /usr/local && \
    wget -q -O - https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz | tar zxf -
ENV PATH=/usr/local/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}

RUN pip install ninja
