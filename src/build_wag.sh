#!/bin/bash

WAGROOT=~/private/research/policy_weaving/generator/src/wag/lib/

make wag -C $WAGROOT \
    BATTERIES=/unsup/ocaml/lib/ocaml/site-lib/batteries/ \
    BINSTUB=1 \
    CAMLIDLDIR=/u/w/r/wrharris/public/camlidl-1.05/runtime \
    LIBSTD=/s/gcc-4.5.2/lib64/ \
    LLVM=/scratch/llvm-3.1.src/ \
    OCAMLDIR=/unsup/ocaml/ \
    Z3DIR=/u/w/r/wrharris/public/z3/
