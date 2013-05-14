; ModuleID = 'fstat_harness.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd9.0"

%struct.iovec = type { i8*, i64 }
%struct.stat = type <{ i32, i32, i16, i16, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, i32, i32, i32, i32, %struct.timespec }>
%struct.timespec = type { i64, i64 }
%struct.fstat_rv = type { %struct.stat, i32, [4 x i8] }

@.str = private unnamed_addr constant [23 x i8] c"fstat return code: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"fstat size: %ld\0A\00", align 1

define %struct.iovec* @shim_fstat2(i32 %fd) nounwind uwtable {
  %1 = alloca i32, align 4
  %buf = alloca %struct.stat, align 8
  %rc = alloca i32, align 4
  %frv = alloca %struct.fstat_rv*, align 8
  %rv = alloca %struct.iovec*, align 8
  store i32 %fd, i32* %1, align 4
  call void @cw_act(i32 1)
  %2 = load i32* %1, align 4
  %3 = call i32 @fstat(i32 %2, %struct.stat* %buf)
  store i32 %3, i32* %rc, align 4
  %4 = call noalias i8* @malloc(i64 128)
  %5 = bitcast i8* %4 to %struct.fstat_rv*
  store %struct.fstat_rv* %5, %struct.fstat_rv** %frv, align 8
  %6 = load %struct.fstat_rv** %frv, align 8
  %7 = getelementptr inbounds %struct.fstat_rv* %6, i32 0, i32 0
  %8 = bitcast %struct.stat* %7 to i8*
  %9 = bitcast %struct.stat* %buf to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 120, i32 8, i1 false)
  %10 = load i32* %rc, align 4
  %11 = load %struct.fstat_rv** %frv, align 8
  %12 = getelementptr inbounds %struct.fstat_rv* %11, i32 0, i32 1
  store i32 %10, i32* %12, align 4
  %13 = call noalias i8* @malloc(i64 16)
  %14 = bitcast i8* %13 to %struct.iovec*
  store %struct.iovec* %14, %struct.iovec** %rv, align 8
  %15 = load %struct.fstat_rv** %frv, align 8
  %16 = bitcast %struct.fstat_rv* %15 to i8*
  %17 = load %struct.iovec** %rv, align 8
  %18 = getelementptr inbounds %struct.iovec* %17, i32 0, i32 0
  store i8* %16, i8** %18, align 8
  %19 = load %struct.iovec** %rv, align 8
  %20 = getelementptr inbounds %struct.iovec* %19, i32 0, i32 1
  store i64 128, i64* %20, align 8
  %21 = load %struct.iovec** %rv, align 8
  ret %struct.iovec* %21
}

declare void @cw_act(i32)

declare i32 @fstat(i32, %struct.stat*)

declare noalias i8* @malloc(i64)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %fd = alloca i32, align 4
  %rv = alloca %struct.iovec*, align 8
  %rc = alloca i32, align 4
  %res_stat = alloca %struct.stat, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @cw_act(i32 0)
  %4 = load i8*** %3, align 8
  %5 = getelementptr inbounds i8** %4, i64 1
  %6 = load i8** %5, align 8
  %7 = call i32 (i8*, i32, ...)* @open(i8* %6, i32 2)
  store i32 %7, i32* %fd, align 4
  %8 = load i32* %fd, align 4
  %9 = call %struct.iovec* @shim_fstat2(i32 %8)
  store %struct.iovec* %9, %struct.iovec** %rv, align 8
  %10 = load %struct.iovec** %rv, align 8
  %11 = getelementptr inbounds %struct.iovec* %10, i32 0, i32 0
  %12 = load i8** %11, align 8
  %13 = bitcast i8* %12 to %struct.fstat_rv*
  %14 = getelementptr inbounds %struct.fstat_rv* %13, i32 0, i32 1
  %15 = load i32* %14, align 4
  store i32 %15, i32* %rc, align 4
  %16 = load %struct.iovec** %rv, align 8
  %17 = getelementptr inbounds %struct.iovec* %16, i32 0, i32 0
  %18 = load i8** %17, align 8
  %19 = bitcast i8* %18 to %struct.fstat_rv*
  %20 = getelementptr inbounds %struct.fstat_rv* %19, i32 0, i32 0
  %21 = bitcast %struct.stat* %res_stat to i8*
  %22 = bitcast %struct.stat* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %22, i64 120, i32 8, i1 false)
  %23 = load i32* %rc, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %23)
  %25 = load i32* %rc, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %31, label %27

; <label>:27                                      ; preds = %0
  %28 = getelementptr inbounds %struct.stat* %res_stat, i32 0, i32 10
  %29 = load i64* %28, align 8
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0), i64 %29)
  br label %31

; <label>:31                                      ; preds = %27, %0
  ret i32 0
}

declare i32 @open(i8*, i32, ...)

declare i32 @printf(i8*, ...)
