; ModuleID = 'bzip2.bc.instr_store.bc'
target triple = "x86_64-unknown-freebsd9.0"

@num_internals = global i32 76
@0 = global i32 0
@1 = global i32 0
@int_trans_pres = global [84 x i32] [i32 0, i32 1, i32 2, i32 3, i32 3, i32 4, i32 4, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 13, i32 13, i32 16, i32 17, i32 18, i32 19, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 26, i32 27, i32 27, i32 27, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56]
@int_trans_acts = global [84 x i32] [i32 18, i32 18, i32 18, i32 18, i32 70, i32 19, i32 20, i32 12, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 71, i32 42, i32 43, i32 2, i32 15, i32 3, i32 4, i32 9, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 72, i32 73, i32 74, i32 75, i32 5, i32 67, i32 68, i32 69, i32 6, i32 7, i32 8, i32 10, i32 11, i32 13, i32 14, i32 16, i32 17, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1]
@int_trans_prims = global [84 x void ()*] [void ()* @cw_fork, void ()* @cw_fork, void ()* @cw_fork, void ()* @cw_fork, void ()* @cw_fork, void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD, SEEK, WRITE,  }", void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD, SEEK, WRITE,  }", void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{ READ, SEEK,  }", void ()* @cw_noop, void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD, SEEK, WRITE,  }", void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{ READ, SEEK,  }"]
@int_trans_posts = global [84 x i32] [i32 46, i32 47, i32 48, i32 45, i32 49, i32 5, i32 6, i32 41, i32 31, i32 31, i32 7, i32 7, i32 10, i32 10, i32 11, i32 11, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 12, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 15, i32 3, i32 14, i32 17, i32 43, i32 36, i32 20, i32 39, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 21, i32 24, i32 24, i32 24, i32 24, i32 22, i32 23, i32 24, i32 25, i32 27, i32 28, i32 29, i32 30, i32 37, i32 38, i32 19, i32 40, i32 26, i32 42, i32 16, i32 44, i32 18, i32 0, i32 1, i32 2, i32 32, i32 33, i32 34, i32 35]
@num_int_trans = global i32 84
@call_trans_prims = global [2 x void ()*] [void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD, SEEK, WRITE,  }", void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{ READ, SEEK,  }"]
@call_trans_posts = global [2 x i32] [i32 13, i32 4]
@num_calls = global i32 2
@ret_trans_pres = global [85 x i32] [i32 5, i32 5, i32 5, i32 5, i32 5, i32 7, i32 7, i32 7, i32 7, i32 7, i32 8, i32 8, i32 8, i32 8, i32 8, i32 9, i32 9, i32 9, i32 9, i32 9, i32 10, i32 10, i32 10, i32 10, i32 10, i32 11, i32 11, i32 11, i32 11, i32 11, i32 12, i32 12, i32 12, i32 12, i32 12, i32 15, i32 15, i32 15, i32 15, i32 15, i32 21, i32 21, i32 21, i32 21, i32 21, i32 22, i32 22, i32 22, i32 22, i32 22, i32 23, i32 23, i32 23, i32 23, i32 23, i32 24, i32 24, i32 24, i32 24, i32 24, i32 25, i32 25, i32 25, i32 25, i32 25, i32 28, i32 28, i32 28, i32 28, i32 28, i32 29, i32 29, i32 29, i32 29, i32 29, i32 30, i32 30, i32 30, i32 30, i32 30, i32 31, i32 31, i32 31, i32 31, i32 31]
@ret_trans_stacks = global [85 x i32] [i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49, i32 45, i32 46, i32 47, i32 48, i32 49]
@ret_trans_prims = global [85 x void ()*] [void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{ READ, SEEK,  }", void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_noop, void ()* @cw_cap_enter]
@ret_trans_posts = global [85 x i32] [i32 52, i32 50, i32 51, i32 52, i32 55, i32 52, i32 50, i32 51, i32 52, i32 55, i32 52, i32 50, i32 51, i32 52, i32 56, i32 52, i32 50, i32 51, i32 52, i32 55, i32 52, i32 50, i32 51, i32 52, i32 55, i32 52, i32 50, i32 51, i32 52, i32 55, i32 52, i32 50, i32 51, i32 52, i32 55, i32 52, i32 50, i32 51, i32 52, i32 55, i32 51, i32 51, i32 51, i32 51, i32 54, i32 51, i32 51, i32 51, i32 51, i32 54, i32 51, i32 51, i32 51, i32 51, i32 54, i32 51, i32 51, i32 51, i32 51, i32 54, i32 51, i32 51, i32 51, i32 51, i32 54, i32 50, i32 50, i32 50, i32 50, i32 53, i32 50, i32 50, i32 50, i32 50, i32 53, i32 50, i32 50, i32 50, i32 50, i32 53, i32 52, i32 50, i32 51, i32 52, i32 55]
@num_ret_trans = global i32 85

declare void @cw_lc_limitfd(i32, i32)

declare void @cw_refresh(i32)

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{  }"() {
entry:
  %catch = load i32* @0
  call void @cw_lc_limitfd(i32 %catch, i32 0)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{ READ,  }"() {
entry:
  %catch = load i32* @0
  call void @cw_lc_limitfd(i32 %catch, i32 -2147483003)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{ READ, SEEK,  }"() {
entry:
  %catch = load i32* @0
  call void @cw_lc_limitfd(i32 %catch, i32 -2147483003)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 0, i32 %302) nounwind, !dbg !2457)_{ SEEK,  }"() {
entry:
  %catch = load i32* @0
  call void @cw_lc_limitfd(i32 %catch, i32 4)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 0)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD,  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 8192)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD, SEEK,  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 8196)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD, SEEK, WRITE,  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 8198)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ FCHMOD, WRITE,  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 8194)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ SEEK,  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 4)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ SEEK, WRITE,  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 6)
  ret void
}

define void @"cw_lc_limitfd_desc(  call void @cw_desc(i32 1, i32 %312) nounwind, !dbg !2459)_{ WRITE,  }"() {
entry:
  %catch = load i32* @1
  call void @cw_lc_limitfd(i32 %catch, i32 2)
  ret void
}

declare void @cw_cap_enter()

declare void @cw_fork()

declare void @cw_noop()

declare void @cw_rpc()
