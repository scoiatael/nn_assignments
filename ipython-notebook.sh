#!/usr/bin/env bash

# The directory where the script is
export NN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$NN/set-env.sh"
PIO_CUDA="/pio/os/cuda-7.0/set-env.sh"
[ -f $PIO_CUDA ] && source $PIO_CUDA && echo 'Sourced cuda configuration'

export THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32

exec ipython notebook --profile=foo
