FROM gcr.io/deeplearning-platform-release/base-cu110
#FROM nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu20.04

RUN apt update && apt -y install curl

WORKDIR /opt
RUN curl https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.0-rc1-linux-x86_64.tar.gz | tar xzv

RUN ln -s julia-1.6.0-rc1 julia
RUN ln -s /opt/julia/bin/julia /usr/local/bin/julia


RUN julia -e 'import Pkg; Pkg.add("CUDA")'

RUN echo Setting up CUDA artifacts

COPY artifacts /root/.julia/artifacts/

RUN ls -l /root/.julia/artifacts

RUN julia dlartifacts.jl

