#wag.sh: call WAG on an LLVM bitcode file.
wag \
    -host_name Capsicum \
    -pol_file ../test/benchmarks/gzip/right_amb.txt \
    -llvm_entry $1 \
    -proj_to_dot
