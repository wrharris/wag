#!/bin/bash

clang -c gzip.bc.wvd.bc
g++ \
    -L/usr/lib64/ \
    -l pcap \
    ~/private/research/policy_weaving/generator/implementation/wag/lib/runtime/weaver_runtime.o \
    gzip.bc.wvd.o
