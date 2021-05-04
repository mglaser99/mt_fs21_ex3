#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

tools=$base/tools
mkdir -p $tools

echo "Make sure this script is executed AFTER you have activated a virtualenv"

pip install torch sacremoses

# install Moses scripts for preprocessing

git clone https://github.com/bricksdont/moses-scripts $tools/moses-scripts

# install pytorch examples

git clone https://github.com/pytorch/examples $tools/pytorch-examples

# install my examples repo with the changed generate.py

git clone https://github.com/mglaser99/examples.git $tools/examples