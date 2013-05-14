; ModuleID = 'test0.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g = common global i32 0, align 4

define i32 @f(i32 %a) nounwind uwtable {
  %1 = alloca i32, align 4
  %fd = alloca i32, align 4
  %x = alloca i32, align 4
  %low = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 42, i32* %fd, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* %x, align 4
  %3 = load i32* %1, align 4
  store i32 %3, i32* @g, align 4
  %4 = load i32* %x, align 4
  %5 = load i32* %x, align 4
  %6 = add nsw i32 %5, %4
  store i32 %6, i32* %x, align 4
  %7 = load i32* %x, align 4
  %8 = load i32* %x, align 4
  %9 = mul nsw i32 %8, %7
  store i32 %9, i32* %x, align 4
  %10 = load i32* %x, align 4
  %11 = add nsw i32 %10, 6
  store i32 %11, i32* %low, align 4
  %12 = load i32* %low, align 4
  ret i32 %12
}

define i32 @main() nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 42)
  ret i32 %2
}
