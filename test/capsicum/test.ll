; ModuleID = 'test.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@stdout = external global %struct._IO_FILE*
@stdin = external global %struct._IO_FILE*

define i32 @vprintf(i8* noalias nocapture %__fmt, %struct.__va_list_tag* %__arg) nounwind uwtable inlinehint {
entry:
  %0 = load %struct._IO_FILE** @stdout, align 8, !tbaa !0
  %call = tail call i32 @vfprintf(%struct._IO_FILE* %0, i8* %__fmt, %struct.__va_list_tag* %__arg) nounwind
  ret i32 %call
}

declare i32 @vfprintf(%struct._IO_FILE* nocapture, i8* nocapture, %struct.__va_list_tag*) nounwind

define i32 @getchar() nounwind uwtable inlinehint {
entry:
  %0 = load %struct._IO_FILE** @stdin, align 8, !tbaa !0
  %call = tail call i32 @_IO_getc(%struct._IO_FILE* %0) nounwind
  ret i32 %call
}

declare i32 @_IO_getc(%struct._IO_FILE* nocapture) nounwind

define i32 @fgetc_unlocked(%struct._IO_FILE* %__fp) nounwind uwtable inlinehint {
entry:
  %_IO_read_ptr = getelementptr inbounds %struct._IO_FILE* %__fp, i64 0, i32 1
  %0 = load i8** %_IO_read_ptr, align 8, !tbaa !0
  %_IO_read_end = getelementptr inbounds %struct._IO_FILE* %__fp, i64 0, i32 2
  %1 = load i8** %_IO_read_end, align 8, !tbaa !0
  %cmp = icmp ult i8* %0, %1
  br i1 %cmp, label %cond.false, label %cond.true, !prof !3

cond.true:                                        ; preds = %entry
  %call = tail call i32 @__uflow(%struct._IO_FILE* %__fp) nounwind
  br label %cond.end

cond.false:                                       ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_IO_read_ptr, align 8, !tbaa !0
  %2 = load i8* %0, align 1, !tbaa !1
  %conv3 = zext i8 %2 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %conv3, %cond.false ]
  ret i32 %cond
}

declare i32 @__uflow(%struct._IO_FILE*)

define i32 @getc_unlocked(%struct._IO_FILE* %__fp) nounwind uwtable inlinehint {
entry:
  %_IO_read_ptr = getelementptr inbounds %struct._IO_FILE* %__fp, i64 0, i32 1
  %0 = load i8** %_IO_read_ptr, align 8, !tbaa !0
  %_IO_read_end = getelementptr inbounds %struct._IO_FILE* %__fp, i64 0, i32 2
  %1 = load i8** %_IO_read_end, align 8, !tbaa !0
  %cmp = icmp ult i8* %0, %1
  br i1 %cmp, label %cond.false, label %cond.true, !prof !3

cond.true:                                        ; preds = %entry
  %call = tail call i32 @__uflow(%struct._IO_FILE* %__fp) nounwind
  br label %cond.end

cond.false:                                       ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_IO_read_ptr, align 8, !tbaa !0
  %2 = load i8* %0, align 1, !tbaa !1
  %conv3 = zext i8 %2 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %conv3, %cond.false ]
  ret i32 %cond
}

define i32 @getchar_unlocked() nounwind uwtable inlinehint {
entry:
  %0 = load %struct._IO_FILE** @stdin, align 8, !tbaa !0
  %_IO_read_ptr = getelementptr inbounds %struct._IO_FILE* %0, i64 0, i32 1
  %1 = load i8** %_IO_read_ptr, align 8, !tbaa !0
  %_IO_read_end = getelementptr inbounds %struct._IO_FILE* %0, i64 0, i32 2
  %2 = load i8** %_IO_read_end, align 8, !tbaa !0
  %cmp = icmp ult i8* %1, %2
  br i1 %cmp, label %cond.false, label %cond.true, !prof !3

cond.true:                                        ; preds = %entry
  %call = tail call i32 @__uflow(%struct._IO_FILE* %0) nounwind
  br label %cond.end

cond.false:                                       ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8* %1, i64 1
  store i8* %incdec.ptr, i8** %_IO_read_ptr, align 8, !tbaa !0
  %3 = load i8* %1, align 1, !tbaa !1
  %conv3 = zext i8 %3 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %conv3, %cond.false ]
  ret i32 %cond
}

define i32 @putchar(i32 %__c) nounwind uwtable inlinehint {
entry:
  %0 = load %struct._IO_FILE** @stdout, align 8, !tbaa !0
  %call = tail call i32 @_IO_putc(i32 %__c, %struct._IO_FILE* %0) nounwind
  ret i32 %call
}

declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) nounwind

define i32 @fputc_unlocked(i32 %__c, %struct._IO_FILE* %__stream) nounwind uwtable inlinehint {
entry:
  %_IO_write_ptr = getelementptr inbounds %struct._IO_FILE* %__stream, i64 0, i32 5
  %0 = load i8** %_IO_write_ptr, align 8, !tbaa !0
  %_IO_write_end = getelementptr inbounds %struct._IO_FILE* %__stream, i64 0, i32 6
  %1 = load i8** %_IO_write_end, align 8, !tbaa !0
  %cmp = icmp ult i8* %0, %1
  br i1 %cmp, label %cond.false, label %cond.true, !prof !3

cond.true:                                        ; preds = %entry
  %conv3 = and i32 %__c, 255
  %call = tail call i32 @__overflow(%struct._IO_FILE* %__stream, i32 %conv3) nounwind
  br label %cond.end

cond.false:                                       ; preds = %entry
  %conv4 = trunc i32 %__c to i8
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_IO_write_ptr, align 8, !tbaa !0
  store i8 %conv4, i8* %0, align 1, !tbaa !1
  %conv6 = and i32 %__c, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %conv6, %cond.false ]
  ret i32 %cond
}

declare i32 @__overflow(%struct._IO_FILE*, i32)

define i32 @putc_unlocked(i32 %__c, %struct._IO_FILE* %__stream) nounwind uwtable inlinehint {
entry:
  %_IO_write_ptr = getelementptr inbounds %struct._IO_FILE* %__stream, i64 0, i32 5
  %0 = load i8** %_IO_write_ptr, align 8, !tbaa !0
  %_IO_write_end = getelementptr inbounds %struct._IO_FILE* %__stream, i64 0, i32 6
  %1 = load i8** %_IO_write_end, align 8, !tbaa !0
  %cmp = icmp ult i8* %0, %1
  br i1 %cmp, label %cond.false, label %cond.true, !prof !3

cond.true:                                        ; preds = %entry
  %conv3 = and i32 %__c, 255
  %call = tail call i32 @__overflow(%struct._IO_FILE* %__stream, i32 %conv3) nounwind
  br label %cond.end

cond.false:                                       ; preds = %entry
  %conv4 = trunc i32 %__c to i8
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_IO_write_ptr, align 8, !tbaa !0
  store i8 %conv4, i8* %0, align 1, !tbaa !1
  %conv6 = and i32 %__c, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %conv6, %cond.false ]
  ret i32 %cond
}

define i32 @putchar_unlocked(i32 %__c) nounwind uwtable inlinehint {
entry:
  %0 = load %struct._IO_FILE** @stdout, align 8, !tbaa !0
  %_IO_write_ptr = getelementptr inbounds %struct._IO_FILE* %0, i64 0, i32 5
  %1 = load i8** %_IO_write_ptr, align 8, !tbaa !0
  %_IO_write_end = getelementptr inbounds %struct._IO_FILE* %0, i64 0, i32 6
  %2 = load i8** %_IO_write_end, align 8, !tbaa !0
  %cmp = icmp ult i8* %1, %2
  br i1 %cmp, label %cond.false, label %cond.true, !prof !3

cond.true:                                        ; preds = %entry
  %conv3 = and i32 %__c, 255
  %call = tail call i32 @__overflow(%struct._IO_FILE* %0, i32 %conv3) nounwind
  br label %cond.end

cond.false:                                       ; preds = %entry
  %conv4 = trunc i32 %__c to i8
  %incdec.ptr = getelementptr inbounds i8* %1, i64 1
  store i8* %incdec.ptr, i8** %_IO_write_ptr, align 8, !tbaa !0
  store i8 %conv4, i8* %1, align 1, !tbaa !1
  %conv6 = and i32 %__c, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %conv6, %cond.false ]
  ret i32 %cond
}

define i32 @feof_unlocked(%struct._IO_FILE* nocapture %__stream) nounwind uwtable readonly inlinehint {
entry:
  %_flags = getelementptr inbounds %struct._IO_FILE* %__stream, i64 0, i32 0
  %0 = load i32* %_flags, align 4, !tbaa !4
  %and = lshr i32 %0, 4
  %and.lobit = and i32 %and, 1
  ret i32 %and.lobit
}

define i32 @ferror_unlocked(%struct._IO_FILE* nocapture %__stream) nounwind uwtable readonly inlinehint {
entry:
  %_flags = getelementptr inbounds %struct._IO_FILE* %__stream, i64 0, i32 0
  %0 = load i32* %_flags, align 4, !tbaa !4
  %and = lshr i32 %0, 5
  %and.lobit = and i32 %and, 1
  ret i32 %and.lobit
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @foo(i32 0) nounwind
  tail call void @foo(i32 1) nounwind
  tail call void @foo(i32 2) nounwind
  tail call void @foo(i32 3) nounwind
  tail call void @foo(i32 4) nounwind
  ret i32 10
}

declare void @foo(i32)

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!4 = metadata !{metadata !"int", metadata !1}
