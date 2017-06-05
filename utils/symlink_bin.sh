#!/bin/bash

machine_local_bin=$(git rev-parse --show-toplevel)"/bin"
user_bin=$HOME"/bin"

ln -s $machine_local_bin $user_bin
