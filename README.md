# Usage
### ROCm version
ROCm 5.3.2
### Device
MI200X

## Test Composable Kernel
```bash
cd ck
```

### Build Composable Kernel
We change the repeat time each instance in tuning to 100. (build_ck.sh line8)
```bash
./build_ck.sh
```

### Test gemm and gemm_fast_gelu
Because of CK doesn't provide profiler of gemm_fast_gelu, use gemm_add_add_fast_gelu to profile.

```bash
./test_gemm.sh
./test_gemm_fast_gelu.sh
```

All results are in logs file under ./composable_kernel/build/bin/

## Test Composable Kernel in ORT
```bash
cd ort
```

### Build ORT
We change the repeat time each instance in tuning to 100. (build_ck.sh line8)
```bash
./build_ort.sh
```

### Test gemm and gemm_fast_gelu

```bash
./test_gemm.sh
./test_gemm_fast_gelu.sh
```
The default initialilzation is demical initialization. Please modify related test file to change the initialization method. See more details on test_gemm.sh and test_gemm_fast_gelu.sh.

## Result
Gemm
We record the performance of instance DeviceGemmXdl<256, 128, 128, 4, 8, 32, 32, 2, 2> NumPrefetch: 1, LoopScheduler: Interwave, PipelineVersion: v1, which is the best instance selected by CK.
| init method |  ORT(ms)   | CK(ms)  |
| ---------- |  ----  | ----  |
| zero | 1.582  | 1.5806 |
| integer| 1.651  | 1.6828 |
| demical| 2.071 |1.81792|

GemmFastGelu

We record the performance of instance DeviceGemmMultipleD_Xdl_CShuffle<256, 128, 128, 32, 8, 8, Default> LoopScheduler: Interwave, PipelineVersion: v1
, which is the best instance selected by CK.
| init method |  ORT(ms)   | CK(ms)  |
| ---------- |  ----  | ----  |
| zero | 1.885  | 1.871 |
| integer| 1.956  | 2.001 |
| demical| 2.422 |2.184|