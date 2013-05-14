#!/s/std/bin/bash


repl_uses=~/private/research/policy_weaving/generator/src/wag/lib/replfuncuses

# srcs: source bitcodes to virtualize.
srcs="fetchmail.bc fetchmail-body.bc"

# file_ops: the list of file operations to virtualize
virt_ops="accept bind connect getsockopt fdopen fds fstat ftruncate getpeername listen lseek open poll pread pwrite read recv recvfrom recvmsg select send sendto sendmsg setsockopt socket socketpair write"

# shim_ops: file operations that are executed behind a custom shim
shim_ops=""

# Replace uses of functions.
for s in $srcs
do
    # Virtualize file, socket operations.
    for f in $virt_ops
    do
        $repl_uses -prog $s -target $f -replacement virt_$f
        mv $s-$f-virt_$f.bc $s
    done

    # Shim file, socket open.
    for f in $shim_ops
    do
        $repl_uses -prog $s -target $f -replacement shim_$f
        mv $s-$f-shim_$f.bc $s
    done
done
