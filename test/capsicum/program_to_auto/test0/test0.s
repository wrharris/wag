; ModuleID = 'test0.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

module asm "\09.ident\09\22GCC: (GNU) 4.5.2 LLVM: exported\22"

%int = type i32

define i32 @f(i32 %x) nounwind {
entry:
  %x_addr = alloca i32, align 4
  %memtmp = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %x, i32* %x_addr
  %0 = load i32* %x_addr, align 32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %1 = add nsw i32 %0, 2
  store i32 %1, i32* %memtmp, align 1
  br label %return

return:                                           ; preds = %"2"
  %retval = load i32* %memtmp
  ret i32 %retval
}

define i32 @g(i32 %x) nounwind {
entry:
  %x_addr = alloca i32, align 4
  %memtmp = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %x, i32* %x_addr
  %0 = load i32* %x_addr, align 32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %1 = call i32 @f(i32 %0) nounwind
  %2 = call i32 @f(i32 %0) nounwind
  %3 = add nsw i32 %1, %2
  store i32 %3, i32* %memtmp, align 1
  br label %return

return:                                           ; preds = %"2"
  %retval = load i32* %memtmp
  ret i32 %retval
}

define i32 @h(i32 %x) nounwind {
entry:
  %x_addr = alloca i32, align 4
  %memtmp = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %x, i32* %x_addr
  %0 = load i32* %x_addr, align 32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %1 = add nsw i32 %0, 2
  store i32 %1, i32* %memtmp, align 1
  br label %return

return:                                           ; preds = %"2"
  %retval = load i32* %memtmp
  ret i32 %retval
}

define i32 @main() nounwind {
entry:
  %memtmp = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %0 = call i32 @h(i32 undef) nounwind
  %1 = add nsw i32 %0, undef
  %2 = call i32 @g(i32 undef) nounwind
  %3 = add nsw i32 %2, %1
  store i32 %3, i32* %memtmp, align 1
  br label %return

return:                                           ; preds = %"2"
  %retval = load i32* %memtmp
  ret i32 %retval
}
