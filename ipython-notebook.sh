#!/usr/bin/env bash

# The directory where the script is
export NN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$NN/set-env.sh"

exec ipython notebook --profile=foo
