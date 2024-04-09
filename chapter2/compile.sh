#!/bin/bash

set -x

gcc -O0 -o mystery1 -I../book-user-code mystery1.cc
gcc -O0 -S -o mystery1.S -I../book-user-code mystery1.cc

gcc -O0 -o mul_inst -I../book-user-code mul_inst.cc
gcc -O0 -S -o mul_inst.S -I../book-user-code mul_inst.cc

gcc -O2 -fno-tree-reassoc -o float_mul_inst -I../book-user-code float_mul_inst.cc
gcc -O2 -fno-tree-reassoc -S -o float_mul_inst.S -I../book-user-code float_mul_inst.cc

gcc -O2 -fno-tree-reassoc -o float_add_inst -I../book-user-code float_add_inst.cc
gcc -O2 -fno-tree-reassoc -S -o float_add_inst.S -I../book-user-code float_add_inst.cc

echo 'Done!'

