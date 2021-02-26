import Pkg, Artifacts, CUDA

toml = Artifacts.find_artifacts_toml(pathof(CUDA))

for a in ["CUDA110", "CUDNN_CUDA110", "CUTENSOR_CUDA110", 
          "CUDA111", "CUDNN_CUDA111", "CUTENSOR_CUDA111"]
  Pkg.Artifacts.ensure_artifact_installed(a, toml)
end
