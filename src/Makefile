# Set these to point to local copies of libraries.

# Aliases for subdirectories in the source tree.
CAP=./Hosts/Capsicum/
TESTS=../test/sym_auto/
WAG=/u/w/r/wrharris/private/research/policy_weaving/generator/src/wag/lib/

# Define intermediate variables pointing to subdirs of the LLVM tree.
LLVMINC=$(LLVM)/include/
LLVMLIB=$(LLVM)/Release+Asserts/lib/
LLVMOCAML=$(LLVMLIB)/ocaml/

# Configure build system for native or bytecode target.
ifdef DBG
	BINDIR = ./bin_prog/stubs/
	IFLAGS = -g
	LFLAGS=
	LIBEXT = cma
	OCC = ocamlc
	TARGEXT = cmo
else
	LIBEXT = cmxa
	OCC = ocamlopt
	TARGEXT = cmx
endif

# Configure for full or stub bin prog model constructors.
ifdef BINSTUB
	BINDIR = ./bin_prog/stubs/
else
	BINDIR = ./bin_prog/
endif

# IFLAGS: include flags.
IFLAGS += -I $(Z3DIR)/ocaml/ \
	-I $(LLVMOCAML)/ \
	-I $(OCAMLLIB)/ \
	-I $(LLVMINC)/ \
	-I $(BINDIR)/ \
	-I . \
	-I ./Hosts/ \
	-I ./Hosts/Capsicum/ \
	-I $(BATTERIES)

# LFLAGS: linker flags.
LFLAGS+= -cclib -L$(Z3DIR)/ocaml/ \
			-cclib -lz3stubs \
			-cclib $(Z3DIR)/ocaml/z3.a \
			-cclib $(Z3DIR)/lib/libz3.a \
			-cclib -L$(LIBSTD) \
			-cc g++ \
			-cclib $(CAMLIDLDIR)/libcamlidl.a \
			-ccopt -L$(LLVMOCAML)/ \
			-ccopt -lgmp \
			-ccopt -L$(LLVMLIB)/ \
			-ccopt -lpthread \
			-ccopt -ldl \
			-ccopt -lm \
			-cclib -lLLVMBitWriter \
			-cclib -lLLVMBitReader \
			-cclib -lLLVMCore \
			-cclib -lLLVMSupport \
			-cclib -lgomp

# CC: the C++ compiler
CC=g++

all: binprog cappols capsicum cgslicer dbgprinters host libext policy program replfuncuses vpa wag z3lib

# binprog: compile constuctor for models of binaries.
binprog: vpa libext
	$(OCC) -c $(IFLAGS) $(BINDIR)/Bin_prog.mli
ifdef BINSTUB
	$(OCC) -c $(IFLAGS) $(BINDIR)/Bin_prog.ml
else
	$(CC) -c $(IFLAGS) -I../wali/Source -o ./open_nwa/open_nwa.o \
		./open_nwa/open_nwa.cpp
	$(OCC) -c $(IFLAGS) -cclib ./open_nwa/open_nwa.o $(BINDIR)/Bin_prog.ml
endif

# OCYACC: the OCamlYacc compiler.
OCYACC=ocamlyacc

# OCLEX: the OCamlLex compiler.
OCLEX=ocamllex

# cappol_legex: lexer for Capsicum policy regexes.
cappol_lex: cappol_parse ./Hosts/Capsicum/Regex_lex.mll
	$(OCLEX) ./Hosts/Capsicum/Regex_lex.mll
	$(OCC) -c $(IFLAGS) ./Hosts/Capsicum/Regex_lex.ml

# cappol_parse: parser for Capsicum policy regexes.
cappol_parse: regex_types ./Hosts/Capsicum/Regex_parse.ml ./Hosts/Capsicum/Regex_parse.mli 
#	$(OCYACC) ./Hosts/Capsicum/Regex_parse.mly
	$(OCC) -c $(IFLAGS) ./Hosts/Capsicum/Regex_parse.mli
	$(OCC) -c $(IFLAGS) ./Hosts/Capsicum/Regex_parse.ml

# cappols: module of Capsicum policies.
cappols: host program vpa policy cappol_lex cappol_parse
	$(OCC) -c $(IFLAGS) ./Hosts/Capsicum/Cappols.mli
	$(OCC) -c $(IFLAGS) ./Hosts/Capsicum/Cappols.ml

# capsicum: compile the Capsicum model.
capsicum: libext host program vpa regex_types cappols
	$(OCC) -c $(IFLAGS) ./Hosts/Capsicum/Capsicum.mli
	$(OCC) -c $(IFLAGS) ./Hosts/Capsicum/Capsicum.ml

# cgslicer: slice the callgraph
cgslicer: llvmprog
	$(OCC) $(IFLAGS) -o cgslice \
		$(LFLAGS) \
		Libext.$(TARGEXT) \
		Vpa.$(TARGEXT) \
		$(LLVMOCAML)/llvm.$(LIBEXT) \
		$(LLVMOCAML)/llvm_analysis.$(LIBEXT) \
		$(LLVMOCAML)/llvm_bitreader.$(LIBEXT) \
		Llvm_prog.$(TARGEXT) \
		cg_slicer.ml

# clean: remove all object and bytecode files
clean:
	rm *.cm* *.o ./bin_prog/*.cm* ./bin_prog/Bin_prog.o \
		./bin_prog/stubs/Bin_prog.cm* ./bin_prog/stubs/Bin_prog.o \
		./dbg/*.cm* ./Hosts/*.cm* ./Hosts/*/*.cm* ./Hosts/*/*.o wag

# dbgprinters: build debugging libraries.
dbgprinters:
	ocamlc -c -o ./dbg/dbg_printer.cmo -I $(IFLAGS) ./dbg/dbg_printer.ml

# host: the interface for hosts.
host: program policy
	$(OCC) -c $(IFLAGS) ./Hosts/Host.mli

# libext: a bunch of hacky extensions to Pervasives that should be
# replaced by a real library.
libext:
	$(OCC) -c $(IFLAGS) ./Libext.mli
	$(OCC) -c $(IFLAGS) ./Libext.ml

# llvmprog: model constructor of an LLVM program.
llvmprog: libext vpa
	$(OCC) -c $(IFLAGS) ./Llvm_prog.mli
	$(OCC) -c $(IFLAGS) ./Llvm_prog.ml

# policy: interface for policy modules.
policy: vpa program
	$(OCC) -c $(IFLAGS) ./Hosts/Policy.mli
	$(OCC) -c $(IFLAGS) ./Hosts/Policy.ml

# program: model of program constructed from multiple alphabets.
program: libext vpa llvmprog binprog
	$(OCC) -c $(IFLAGS) ./Program.mli
	$(OCC) -c $(IFLAGS) ./Program.ml

# regex_types: module containing regular expression types.
regex_types:
	$(OCC) -c ./Hosts/Capsicum/Cappol_regex_types.ml

# replfuncuses: standalone executable that replaces all uses of a given target
# function with uses of a given replacement function.
replfuncuses:
	ocamlopt $(IFLAGS) \
		-o replfuncuses \
		$(LFLAGS) \
		$(LLVMOCAML)/llvm.$(LIBEXT) \
		$(LLVMOCAML)/llvm_bitreader.$(LIBEXT) \
		$(LLVMOCAML)/llvm_bitwriter.$(LIBEXT) \
		./Repl_func_uses.ml

# vpa: visibly-pushdown systems, their games, their strategies.
vpa: libext
	$(OCC) -c $(IFLAGS) ./Vpa.mli
	$(OCC) -c $(IFLAGS) ./Vpa.ml

# wag: the policy-weaver generator driver and game solver.
wag: libext z3lib vpa llvmprog program cappols capsicum
	ocamlfind \
	$(OCC) $(IFLAGS) -o wag \
		-package batteries \
		-linkpkg \
		$(LFLAGS) \
		$(Z3DIR)/ocaml/z3.$(LIBEXT) \
		Libext.$(TARGEXT) \
		Z3_lib.$(TARGEXT) \
		Vpa.$(TARGEXT) \
		$(LLVMOCAML)/llvm.$(LIBEXT) \
		$(LLVMOCAML)/llvm_analysis.$(LIBEXT) \
		$(LLVMOCAML)/llvm_bitreader.$(LIBEXT) \
		$(LLVMOCAML)/llvm_bitwriter.$(LIBEXT) \
		Llvm_prog.$(TARGEXT) \
		$(BINDIR)/Bin_prog.$(TARGEXT) \
		Program.$(TARGEXT) \
		Hosts/Policy.$(TARGEXT) \
		$(CAP)/Cappol_regex_types.$(TARGEXT) \
		$(CAP)/Regex_lex.$(TARGEXT) \
		$(CAP)/Regex_parse.$(TARGEXT) \
		$(CAP)/Cappols.$(TARGEXT) \
		$(CAP)/Capsicum.$(TARGEXT) \
		Wag.ml

# z3lib: wrapper for Z3.
z3lib:
	$(OCC) -c $(IFLAGS) ./Z3_lib.mli
	$(OCC) -c $(IFLAGS) ./Z3_lib.ml
