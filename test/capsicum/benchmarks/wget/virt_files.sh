#!/s/std/bin/bash


repl_uses=~/private/research/policy_weaving/generator/src/wag/lib/replfuncuses

# srcs: source bitcodes to virtualize.
srcs="wget.bc wget-body.bc wget.bc.wvd.bc wget-body.bc.wvd.bc"

# file_ops: the list of file operations to virtualize
virt_ops="accept bind fcntl fdopen fds fstat ftruncate lseek poll pread pwrite read select write"

# shim_ops: file operations that are executed behind a custom shim
shim_ops="fopen open"

# Replace uses of functions.
for s in $srcs
do
    # Virtualize file, socket operations.
    for f in $virt_ops
    do
        $repl_uses -prog $s -target virt_$f -replacement $f
        mv $s-virt_$f-$f.bc $s
    done

    # Shim file, socket open.
    for f in $shim_ops
    do
        $repl_uses -prog $s -target $f -replacement shim_$f
        mv $s-$f-shim_$f.bc $s
    done
done
