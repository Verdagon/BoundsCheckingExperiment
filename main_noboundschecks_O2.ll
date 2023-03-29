; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@stderr = external local_unnamed_addr global ptr, align 8
@.str.3 = private unnamed_addr constant [65 x i8] c"Usage: %s [seed:int] [numRows:int] [numCols:int] [display:bool]\0A\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Example: %s 1337 20 80 true\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"true\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local { i64, i64 } @NextRand(i64 noundef %0) local_unnamed_addr #0 {
  %2 = sdiv i64 %0, 200096
  %3 = add nsw i64 %2, %0
  %4 = mul i64 %3, -33554431
  %5 = sdiv i64 %4, 134217728
  %6 = add nsw i64 %5, %4
  %7 = mul nsw i64 %6, 2685821657736338717
  %8 = sdiv i64 %7, 4294967296
  %9 = insertvalue { i64, i64 } poison, i64 %6, 0
  %10 = insertvalue { i64, i64 } %9, i64 %8, 1
  ret { i64, i64 } %10
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @min(i32 noundef %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.smin.i32(i32 %0, i32 %1)
  ret i32 %3
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @max(i32 noundef %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.smax.i32(i32 %0, i32 %1)
  ret i32 %3
}

; Function Attrs: nofree nounwind memory(write, argmem: none, inaccessiblemem: readwrite) uwtable
define dso_local noalias ptr @makeBoard(i64 noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #2 {
  %4 = shl i64 %1, 3
  %5 = tail call noalias ptr @malloc(i64 noundef %4) #15
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  br label %10

9:                                                ; preds = %14, %3
  ret ptr %5

10:                                               ; preds = %7, %14
  %11 = phi i64 [ %0, %7 ], [ %15, %14 ]
  %12 = phi i64 [ 0, %7 ], [ %17, %14 ]
  %13 = tail call noalias ptr @malloc(i64 noundef %2) #15
  br i1 %8, label %14, label %19

14:                                               ; preds = %19, %10
  %15 = phi i64 [ %11, %10 ], [ %26, %19 ]
  %16 = getelementptr inbounds ptr, ptr %5, i64 %12
  store ptr %13, ptr %16, align 8, !tbaa !5
  %17 = add nuw i64 %12, 1
  %18 = icmp eq i64 %17, %1
  br i1 %18, label %9, label %10, !llvm.loop !9

19:                                               ; preds = %10, %19
  %20 = phi i64 [ %26, %19 ], [ %11, %10 ]
  %21 = phi i64 [ %33, %19 ], [ 0, %10 ]
  %22 = sdiv i64 %20, 200096
  %23 = add nsw i64 %22, %20
  %24 = mul i64 %23, -33554431
  %25 = sdiv i64 %24, 134217728
  %26 = add nsw i64 %25, %24
  %27 = mul nsw i64 %26, 2685821657736338717
  %28 = sdiv i64 %27, 4294967296
  %29 = and i64 %28, 1
  %30 = icmp eq i64 %29, 0
  %31 = zext i1 %30 to i8
  %32 = getelementptr inbounds i8, ptr %13, i64 %21
  store i8 %31, ptr %32, align 1, !tbaa !11
  %33 = add nuw i64 %21, 1
  %34 = icmp eq i64 %33, %2
  br i1 %34, label %14, label %19, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none) uwtable
define dso_local signext i8 @lookup(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4) local_unnamed_addr #4 {
  %6 = getelementptr inbounds ptr, ptr %0, i64 %3
  %7 = load ptr, ptr %6, align 8, !tbaa !5
  %8 = getelementptr inbounds i8, ptr %7, i64 %4
  %9 = load i8, ptr %8, align 1, !tbaa !11
  ret i8 %9
}

; Function Attrs: nofree nounwind memory(readwrite, argmem: read) uwtable
define dso_local noalias ptr @cellularAutomata(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #5 {
  %4 = shl i64 %1, 3
  %5 = tail call noalias ptr @malloc(i64 noundef %4) #15
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %13, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  %9 = trunc i64 %1 to i32
  %10 = add i32 %9, -1
  %11 = trunc i64 %2 to i32
  %12 = add i32 %11, -1
  br label %14

13:                                               ; preds = %29, %3
  ret ptr %5

14:                                               ; preds = %7, %29
  %15 = phi i32 [ -1, %7 ], [ %32, %29 ]
  %16 = phi i64 [ 0, %7 ], [ %31, %29 ]
  %17 = tail call i32 @llvm.smax.i32(i32 %15, i32 0)
  %18 = zext i32 %17 to i64
  %19 = tail call noalias ptr @malloc(i64 noundef %2) #15
  br i1 %8, label %29, label %20

20:                                               ; preds = %14
  %21 = trunc i64 %16 to i32
  %22 = add i32 %21, -1
  %23 = tail call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = add i32 %21, 1
  %25 = tail call i32 @llvm.smin.i32(i32 %10, i32 %24)
  %26 = icmp sgt i32 %23, %25
  %27 = getelementptr inbounds ptr, ptr %0, i64 %16
  %28 = sext i32 %25 to i64
  br label %34

29:                                               ; preds = %81, %14
  %30 = getelementptr inbounds ptr, ptr %5, i64 %16
  store ptr %19, ptr %30, align 8, !tbaa !5
  %31 = add nuw i64 %16, 1
  %32 = add i32 %15, 1
  %33 = icmp eq i64 %31, %1
  br i1 %33, label %13, label %14, !llvm.loop !13

34:                                               ; preds = %20, %81
  %35 = phi i32 [ -1, %20 ], [ %85, %81 ]
  %36 = phi i64 [ 0, %20 ], [ %84, %81 ]
  %37 = tail call i32 @llvm.smax.i32(i32 %35, i32 0)
  %38 = zext i32 %37 to i64
  br i1 %26, label %81, label %39

39:                                               ; preds = %34
  %40 = trunc i64 %36 to i32
  %41 = add i32 %40, -1
  %42 = tail call i32 @llvm.smax.i32(i32 %41, i32 0)
  %43 = add i32 %40, 1
  %44 = tail call i32 @llvm.smin.i32(i32 %12, i32 %43)
  %45 = icmp sgt i32 %42, %44
  %46 = sext i32 %44 to i64
  br label %49

47:                                               ; preds = %55
  %48 = icmp ult i64 %56, 4
  br i1 %48, label %81, label %75

49:                                               ; preds = %39, %55
  %50 = phi i64 [ %18, %39 ], [ %57, %55 ]
  %51 = phi i64 [ 0, %39 ], [ %56, %55 ]
  br i1 %45, label %55, label %52

52:                                               ; preds = %49
  %53 = icmp eq i64 %16, %50
  %54 = getelementptr inbounds ptr, ptr %0, i64 %50
  br label %59

55:                                               ; preds = %71, %49
  %56 = phi i64 [ %51, %49 ], [ %72, %71 ]
  %57 = add nuw nsw i64 %50, 1
  %58 = icmp slt i64 %50, %28
  br i1 %58, label %49, label %47, !llvm.loop !14

59:                                               ; preds = %52, %71
  %60 = phi i64 [ %38, %52 ], [ %73, %71 ]
  %61 = phi i64 [ %51, %52 ], [ %72, %71 ]
  %62 = icmp eq i64 %36, %60
  %63 = select i1 %53, i1 %62, i1 false
  br i1 %63, label %71, label %64

64:                                               ; preds = %59
  %65 = load ptr, ptr %54, align 8, !tbaa !5
  %66 = getelementptr inbounds i8, ptr %65, i64 %60
  %67 = load i8, ptr %66, align 1, !tbaa !11
  %68 = icmp ne i8 %67, 0
  %69 = zext i1 %68 to i64
  %70 = add i64 %61, %69
  br label %71

71:                                               ; preds = %64, %59
  %72 = phi i64 [ %61, %59 ], [ %70, %64 ]
  %73 = add nuw nsw i64 %60, 1
  %74 = icmp slt i64 %60, %46
  br i1 %74, label %59, label %55, !llvm.loop !15

75:                                               ; preds = %47
  %76 = icmp eq i64 %56, 4
  br i1 %76, label %77, label %81

77:                                               ; preds = %75
  %78 = load ptr, ptr %27, align 8, !tbaa !5
  %79 = getelementptr inbounds i8, ptr %78, i64 %36
  %80 = load i8, ptr %79, align 1, !tbaa !11
  br label %81

81:                                               ; preds = %34, %75, %47, %77
  %82 = phi i8 [ %80, %77 ], [ 0, %47 ], [ 1, %75 ], [ 0, %34 ]
  %83 = getelementptr inbounds i8, ptr %19, i64 %36
  store i8 %82, ptr %83, align 1, !tbaa !11
  %84 = add nuw i64 %36, 1
  %85 = add i32 %35, 1
  %86 = icmp eq i64 %84, %2
  br i1 %86, label %29, label %34, !llvm.loop !16
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @display(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #6 {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %11, label %5

5:                                                ; preds = %3
  %6 = icmp eq i64 %2, 0
  br label %7

7:                                                ; preds = %5, %12
  %8 = phi i64 [ 0, %5 ], [ %14, %12 ]
  br i1 %6, label %12, label %9

9:                                                ; preds = %7
  %10 = getelementptr inbounds ptr, ptr %0, i64 %8
  br label %16

11:                                               ; preds = %12, %3
  ret void

12:                                               ; preds = %16, %7
  %13 = tail call i32 @putchar(i32 10)
  %14 = add nuw i64 %8, 1
  %15 = icmp eq i64 %14, %1
  br i1 %15, label %11, label %7, !llvm.loop !17

16:                                               ; preds = %9, %16
  %17 = phi i64 [ 0, %9 ], [ %24, %16 ]
  %18 = load ptr, ptr %10, align 8, !tbaa !5
  %19 = getelementptr inbounds i8, ptr %18, i64 %17
  %20 = load i8, ptr %19, align 1, !tbaa !11
  %21 = icmp eq i8 %20, 0
  %22 = select i1 %21, i32 46, i32 35
  %23 = tail call i32 @putchar(i32 %22)
  %24 = add nuw i64 %17, 1
  %25 = icmp eq i64 %24, %2
  br i1 %25, label %12, label %16, !llvm.loop !18
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = icmp slt i32 %0, 4
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = load ptr, ptr @stderr, align 8, !tbaa !5
  %6 = load ptr, ptr %1, align 8, !tbaa !5
  %7 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef nonnull @.str.3, ptr noundef %6) #16
  %8 = load ptr, ptr @stderr, align 8, !tbaa !5
  %9 = load ptr, ptr %1, align 8, !tbaa !5
  %10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef nonnull @.str.4, ptr noundef %9) #16
  tail call void @exit(i32 noundef 1) #17
  unreachable

11:                                               ; preds = %2
  %12 = getelementptr inbounds ptr, ptr %1, i64 1
  %13 = load ptr, ptr %12, align 8, !tbaa !5
  %14 = tail call i64 @strtol(ptr nocapture noundef nonnull %13, ptr noundef null, i32 noundef 10) #18
  %15 = getelementptr inbounds ptr, ptr %1, i64 2
  %16 = load ptr, ptr %15, align 8, !tbaa !5
  %17 = tail call i64 @strtol(ptr nocapture noundef nonnull %16, ptr noundef null, i32 noundef 10) #18
  %18 = shl i64 %17, 32
  %19 = ashr exact i64 %18, 32
  %20 = getelementptr inbounds ptr, ptr %1, i64 3
  %21 = load ptr, ptr %20, align 8, !tbaa !5
  %22 = tail call i64 @strtol(ptr nocapture noundef nonnull %21, ptr noundef null, i32 noundef 10) #18
  %23 = shl i64 %22, 32
  %24 = ashr exact i64 %23, 32
  %25 = ashr exact i64 %18, 29
  %26 = tail call noalias ptr @malloc(i64 noundef %25) #15
  %27 = icmp eq i64 %18, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %11
  %29 = tail call ptr @cellularAutomata(ptr noundef %26, i64 noundef %19, i64 noundef %24)
  br label %63

30:                                               ; preds = %11
  %31 = shl i64 %14, 32
  %32 = ashr exact i64 %31, 32
  %33 = icmp eq i64 %23, 0
  br label %34

34:                                               ; preds = %38, %30
  %35 = phi i64 [ %32, %30 ], [ %39, %38 ]
  %36 = phi i64 [ 0, %30 ], [ %41, %38 ]
  %37 = tail call noalias ptr @malloc(i64 noundef %24) #15
  br i1 %33, label %38, label %43

38:                                               ; preds = %43, %34
  %39 = phi i64 [ %35, %34 ], [ %50, %43 ]
  %40 = getelementptr inbounds ptr, ptr %26, i64 %36
  store ptr %37, ptr %40, align 8, !tbaa !5
  %41 = add nuw i64 %36, 1
  %42 = icmp eq i64 %41, %19
  br i1 %42, label %59, label %34, !llvm.loop !9

43:                                               ; preds = %34, %43
  %44 = phi i64 [ %50, %43 ], [ %35, %34 ]
  %45 = phi i64 [ %57, %43 ], [ 0, %34 ]
  %46 = sdiv i64 %44, 200096
  %47 = add nsw i64 %46, %44
  %48 = mul i64 %47, -33554431
  %49 = sdiv i64 %48, 134217728
  %50 = add nsw i64 %49, %48
  %51 = mul nsw i64 %50, 2685821657736338717
  %52 = sdiv i64 %51, 4294967296
  %53 = and i64 %52, 1
  %54 = icmp eq i64 %53, 0
  %55 = zext i1 %54 to i8
  %56 = getelementptr inbounds i8, ptr %37, i64 %45
  store i8 %55, ptr %56, align 1, !tbaa !11
  %57 = add nuw i64 %45, 1
  %58 = icmp eq i64 %57, %24
  br i1 %58, label %38, label %43, !llvm.loop !12

59:                                               ; preds = %38
  %60 = tail call ptr @cellularAutomata(ptr noundef nonnull %26, i64 noundef %19, i64 noundef %24)
  br i1 %27, label %63, label %61

61:                                               ; preds = %59
  %62 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %68

63:                                               ; preds = %68, %28, %59
  %64 = phi ptr [ %29, %28 ], [ %60, %59 ], [ %60, %68 ]
  tail call void @free(ptr noundef %26) #18
  %65 = tail call ptr @cellularAutomata(ptr noundef %64, i64 noundef %19, i64 noundef %24)
  br i1 %27, label %74, label %66

66:                                               ; preds = %63
  %67 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %80

68:                                               ; preds = %61, %68
  %69 = phi i64 [ %72, %68 ], [ 0, %61 ]
  %70 = getelementptr inbounds ptr, ptr %26, i64 %69
  %71 = load ptr, ptr %70, align 8, !tbaa !5
  tail call void @free(ptr noundef %71) #18
  %72 = add nuw i64 %69, 1
  %73 = icmp eq i64 %72, %62
  br i1 %73, label %63, label %68, !llvm.loop !19

74:                                               ; preds = %80, %63
  tail call void @free(ptr noundef %64) #18
  %75 = getelementptr inbounds ptr, ptr %1, i64 4
  %76 = load ptr, ptr %75, align 8, !tbaa !5
  %77 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %76, ptr noundef nonnull dereferenceable(5) @.str.5, i64 noundef 4) #19
  %78 = icmp ne i32 %77, 0
  %79 = or i1 %27, %78
  br i1 %79, label %106, label %86

80:                                               ; preds = %66, %80
  %81 = phi i64 [ %84, %80 ], [ 0, %66 ]
  %82 = getelementptr inbounds ptr, ptr %64, i64 %81
  %83 = load ptr, ptr %82, align 8, !tbaa !5
  tail call void @free(ptr noundef %83) #18
  %84 = add nuw i64 %81, 1
  %85 = icmp eq i64 %84, %67
  br i1 %85, label %74, label %80, !llvm.loop !20

86:                                               ; preds = %74
  %87 = icmp eq i64 %23, 0
  br label %88

88:                                               ; preds = %93, %86
  %89 = phi i64 [ 0, %86 ], [ %95, %93 ]
  br i1 %87, label %93, label %90

90:                                               ; preds = %88
  %91 = getelementptr inbounds ptr, ptr %65, i64 %89
  %92 = load ptr, ptr %91, align 8, !tbaa !5
  br label %97

93:                                               ; preds = %97, %88
  %94 = tail call i32 @putchar(i32 10)
  %95 = add nuw i64 %89, 1
  %96 = icmp eq i64 %95, %19
  br i1 %96, label %106, label %88, !llvm.loop !17

97:                                               ; preds = %97, %90
  %98 = phi i64 [ 0, %90 ], [ %104, %97 ]
  %99 = getelementptr inbounds i8, ptr %92, i64 %98
  %100 = load i8, ptr %99, align 1, !tbaa !11
  %101 = icmp eq i8 %100, 0
  %102 = select i1 %101, i32 46, i32 35
  %103 = tail call i32 @putchar(i32 %102)
  %104 = add nuw i64 %98, 1
  %105 = icmp eq i64 %104, %24
  br i1 %105, label %93, label %97, !llvm.loop !18

106:                                              ; preds = %93, %74
  br i1 %27, label %109, label %107

107:                                              ; preds = %106
  %108 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %110

109:                                              ; preds = %110, %106
  tail call void @free(ptr noundef %65) #18
  ret i32 0

110:                                              ; preds = %107, %110
  %111 = phi i64 [ %114, %110 ], [ 0, %107 ]
  %112 = getelementptr inbounds ptr, ptr %65, i64 %111
  %113 = load ptr, ptr %112, align 8, !tbaa !5
  tail call void @free(ptr noundef %113) #18
  %114 = add nuw i64 %111, 1
  %115 = icmp eq i64 %114, %108
  br i1 %115, label %109, label %110, !llvm.loop !21
}

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #10

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @strncmp(ptr nocapture noundef, ptr nocapture noundef, i64 noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #13

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #13

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #14

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind memory(write, argmem: none, inaccessiblemem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind memory(readwrite, argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { nofree nounwind }
attributes #15 = { nounwind allocsize(0) }
attributes #16 = { cold }
attributes #17 = { noreturn nounwind }
attributes #18 = { nounwind }
attributes #19 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 16.0.0"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!7, !7, i64 0}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !10}
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !10}
!21 = distinct !{!21, !10}
