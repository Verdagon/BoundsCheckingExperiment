; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@stderr = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [21 x i8] c"Index out of bounds!\00", align 1
@.str.4 = private unnamed_addr constant [65 x i8] c"Usage: %s [seed:int] [numRows:int] [numCols:int] [display:bool]\0A\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"Example: %s 1337 20 80 true\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"true\00", align 1

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
  %5 = tail call noalias ptr @malloc(i64 noundef %4) #13
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %33, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  br i1 %8, label %34, label %9

9:                                                ; preds = %7, %29
  %10 = phi i64 [ %20, %29 ], [ %0, %7 ]
  %11 = phi i64 [ %31, %29 ], [ 0, %7 ]
  %12 = tail call noalias ptr @malloc(i64 noundef %2) #13
  br label %13

13:                                               ; preds = %9, %13
  %14 = phi i64 [ %10, %9 ], [ %20, %13 ]
  %15 = phi i64 [ 0, %9 ], [ %27, %13 ]
  %16 = sdiv i64 %14, 200096
  %17 = add nsw i64 %16, %14
  %18 = mul i64 %17, -33554431
  %19 = sdiv i64 %18, 134217728
  %20 = add nsw i64 %19, %18
  %21 = mul nsw i64 %20, 2685821657736338717
  %22 = sdiv i64 %21, 4294967296
  %23 = and i64 %22, 1
  %24 = icmp eq i64 %23, 0
  %25 = zext i1 %24 to i8
  %26 = getelementptr inbounds i8, ptr %12, i64 %15
  store i8 %25, ptr %26, align 1, !tbaa !5
  %27 = add nuw i64 %15, 1
  %28 = icmp eq i64 %27, %2
  br i1 %28, label %29, label %13, !llvm.loop !8

29:                                               ; preds = %13
  %30 = getelementptr inbounds ptr, ptr %5, i64 %11
  store ptr %12, ptr %30, align 8, !tbaa !10
  %31 = add nuw i64 %11, 1
  %32 = icmp eq i64 %31, %1
  br i1 %32, label %33, label %9, !llvm.loop !12

33:                                               ; preds = %29, %34, %3
  ret ptr %5

34:                                               ; preds = %7, %34
  %35 = phi i64 [ %38, %34 ], [ 0, %7 ]
  %36 = tail call noalias ptr @malloc(i64 noundef 0) #13
  %37 = getelementptr inbounds ptr, ptr %5, i64 %35
  store ptr %36, ptr %37, align 8, !tbaa !10
  %38 = add nuw i64 %35, 1
  %39 = icmp eq i64 %38, %1
  br i1 %39, label %33, label %34, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local signext i8 @lookup(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4) local_unnamed_addr #4 {
  %6 = icmp ult i64 %3, %1
  br i1 %6, label %10, label %7

7:                                                ; preds = %5
  %8 = load ptr, ptr @stderr, align 8, !tbaa !10
  %9 = tail call i64 @fwrite(ptr nonnull @.str, i64 20, i64 1, ptr %8) #14
  tail call void @exit(i32 noundef 1) #15
  unreachable

10:                                               ; preds = %5
  %11 = icmp ult i64 %4, %2
  br i1 %11, label %15, label %12

12:                                               ; preds = %10
  %13 = load ptr, ptr @stderr, align 8, !tbaa !10
  %14 = tail call i64 @fwrite(ptr nonnull @.str, i64 20, i64 1, ptr %13) #14
  tail call void @exit(i32 noundef 1) #15
  unreachable

15:                                               ; preds = %10
  %16 = getelementptr inbounds ptr, ptr %0, i64 %3
  %17 = load ptr, ptr %16, align 8, !tbaa !10
  %18 = getelementptr inbounds i8, ptr %17, i64 %4
  %19 = load i8, ptr %18, align 1, !tbaa !5
  ret i8 %19
}

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local noalias ptr @cellularAutomata(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #4 {
  %4 = shl i64 %1, 3
  %5 = tail call noalias ptr @malloc(i64 noundef %4) #13
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %111, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  %9 = trunc i64 %1 to i32
  %10 = add i32 %9, -1
  %11 = trunc i64 %2 to i32
  %12 = add i32 %11, -1
  br i1 %8, label %112, label %13

13:                                               ; preds = %7, %107
  %14 = phi i64 [ %109, %107 ], [ 0, %7 ]
  %15 = tail call noalias ptr @malloc(i64 noundef %2) #13
  %16 = trunc i64 %14 to i32
  %17 = add i32 %16, -1
  %18 = tail call i32 @llvm.smax.i32(i32 %17, i32 0)
  %19 = add i32 %16, 1
  %20 = tail call i32 @llvm.smin.i32(i32 %10, i32 %19)
  %21 = icmp sgt i32 %18, %20
  %22 = getelementptr inbounds ptr, ptr %0, i64 %14
  br i1 %21, label %23, label %24

23:                                               ; preds = %13
  tail call void @llvm.memset.p0.i64(ptr align 1 %15, i8 0, i64 %2, i1 false), !tbaa !5
  br label %107

24:                                               ; preds = %13, %59
  %25 = phi i32 [ %64, %59 ], [ 1, %13 ]
  %26 = phi i32 [ %63, %59 ], [ -1, %13 ]
  %27 = phi i64 [ %62, %59 ], [ 0, %13 ]
  %28 = tail call i32 @llvm.smax.i32(i32 %26, i32 0)
  %29 = zext i32 %28 to i64
  %30 = trunc i64 %27 to i32
  %31 = add i32 %30, -1
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = add i32 %30, 1
  %34 = tail call i32 @llvm.smin.i32(i32 %12, i32 %33)
  %35 = icmp sgt i32 %32, %34
  br i1 %35, label %59, label %36

36:                                               ; preds = %24
  %37 = tail call i32 @llvm.smin.i32(i32 %25, i32 %12)
  %38 = sub i32 %37, %28
  %39 = zext i32 %38 to i64
  %40 = tail call i64 @llvm.usub.sat.i64(i64 %2, i64 %29)
  %41 = sext i32 %34 to i64
  %42 = icmp slt i64 %27, %41
  %43 = icmp ugt i64 %40, %39
  %44 = icmp eq i64 %27, %29
  br label %45

45:                                               ; preds = %36, %71
  %46 = phi i32 [ %73, %71 ], [ %18, %36 ]
  %47 = phi i64 [ %72, %71 ], [ 0, %36 ]
  %48 = zext i32 %46 to i64
  %49 = icmp eq i64 %14, %48
  %50 = freeze i1 %49
  %51 = icmp ult i64 %48, %1
  %52 = getelementptr inbounds ptr, ptr %0, i64 %48
  br i1 %51, label %75, label %66

53:                                               ; preds = %105
  %54 = icmp eq i64 %72, 4
  br i1 %54, label %55, label %59

55:                                               ; preds = %53
  %56 = load ptr, ptr %22, align 8, !tbaa !10
  %57 = getelementptr inbounds i8, ptr %56, i64 %27
  %58 = load i8, ptr %57, align 1, !tbaa !5
  br label %59

59:                                               ; preds = %24, %105, %55, %53
  %60 = phi i8 [ %58, %55 ], [ 0, %105 ], [ 1, %53 ], [ 0, %24 ]
  %61 = getelementptr inbounds i8, ptr %15, i64 %27
  store i8 %60, ptr %61, align 1, !tbaa !5
  %62 = add nuw i64 %27, 1
  %63 = add i32 %26, 1
  %64 = add i32 %25, 1
  %65 = icmp eq i64 %62, %2
  br i1 %65, label %107, label %24, !llvm.loop !13

66:                                               ; preds = %45
  %67 = xor i1 %50, true
  %68 = xor i1 %44, true
  %69 = select i1 %67, i1 true, i1 %68
  %70 = select i1 %69, i1 true, i1 %42
  br i1 %70, label %118, label %71

71:                                               ; preds = %66, %96, %89
  %72 = phi i64 [ %90, %89 ], [ %102, %96 ], [ %47, %66 ]
  %73 = add i32 %46, 1
  %74 = icmp sgt i32 %73, %20
  br i1 %74, label %105, label %45, !llvm.loop !14

75:                                               ; preds = %45
  br i1 %50, label %76, label %93

76:                                               ; preds = %75, %89
  %77 = phi i64 [ %91, %89 ], [ %29, %75 ]
  %78 = phi i64 [ %90, %89 ], [ %47, %75 ]
  %79 = icmp eq i64 %27, %77
  br i1 %79, label %89, label %80

80:                                               ; preds = %76
  %81 = icmp ult i64 %77, %2
  br i1 %81, label %82, label %121

82:                                               ; preds = %80
  %83 = load ptr, ptr %52, align 8, !tbaa !10
  %84 = getelementptr inbounds i8, ptr %83, i64 %77
  %85 = load i8, ptr %84, align 1, !tbaa !5
  %86 = icmp ne i8 %85, 0
  %87 = zext i1 %86 to i64
  %88 = add i64 %78, %87
  br label %89

89:                                               ; preds = %82, %76
  %90 = phi i64 [ %78, %76 ], [ %88, %82 ]
  %91 = add nuw nsw i64 %77, 1
  %92 = icmp slt i64 %77, %41
  br i1 %92, label %76, label %71, !llvm.loop !15

93:                                               ; preds = %75, %96
  %94 = phi i64 [ %103, %96 ], [ %29, %75 ]
  %95 = phi i64 [ %102, %96 ], [ %47, %75 ]
  br i1 %43, label %96, label %121

96:                                               ; preds = %93
  %97 = load ptr, ptr %52, align 8, !tbaa !10
  %98 = getelementptr inbounds i8, ptr %97, i64 %94
  %99 = load i8, ptr %98, align 1, !tbaa !5
  %100 = icmp ne i8 %99, 0
  %101 = zext i1 %100 to i64
  %102 = add i64 %95, %101
  %103 = add nuw nsw i64 %94, 1
  %104 = icmp slt i64 %94, %41
  br i1 %104, label %93, label %71, !llvm.loop !15

105:                                              ; preds = %71
  %106 = icmp ult i64 %72, 4
  br i1 %106, label %59, label %53

107:                                              ; preds = %59, %23
  %108 = getelementptr inbounds ptr, ptr %5, i64 %14
  store ptr %15, ptr %108, align 8, !tbaa !10
  %109 = add nuw i64 %14, 1
  %110 = icmp eq i64 %109, %1
  br i1 %110, label %111, label %13, !llvm.loop !16

111:                                              ; preds = %107, %112, %3
  ret ptr %5

112:                                              ; preds = %7, %112
  %113 = phi i64 [ %116, %112 ], [ 0, %7 ]
  %114 = tail call noalias ptr @malloc(i64 noundef 0) #13
  %115 = getelementptr inbounds ptr, ptr %5, i64 %113
  store ptr %114, ptr %115, align 8, !tbaa !10
  %116 = add nuw i64 %113, 1
  %117 = icmp eq i64 %116, %1
  br i1 %117, label %111, label %112, !llvm.loop !16

118:                                              ; preds = %66
  %119 = load ptr, ptr @stderr, align 8, !tbaa !10
  %120 = tail call i64 @fwrite(ptr nonnull @.str, i64 20, i64 1, ptr %119) #14
  tail call void @exit(i32 noundef 1) #15
  unreachable

121:                                              ; preds = %93, %80
  %122 = load ptr, ptr @stderr, align 8, !tbaa !10
  %123 = tail call i64 @fwrite(ptr nonnull @.str, i64 20, i64 1, ptr %122) #14
  tail call void @exit(i32 noundef 1) #15
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local void @display(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #4 {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %29, label %5

5:                                                ; preds = %3
  %6 = icmp eq i64 %2, 0
  br i1 %6, label %24, label %7

7:                                                ; preds = %5, %20
  %8 = phi i64 [ %22, %20 ], [ 0, %5 ]
  %9 = getelementptr inbounds ptr, ptr %0, i64 %8
  br label %10

10:                                               ; preds = %7, %10
  %11 = phi i64 [ 0, %7 ], [ %18, %10 ]
  %12 = load ptr, ptr %9, align 8, !tbaa !10
  %13 = getelementptr inbounds i8, ptr %12, i64 %11
  %14 = load i8, ptr %13, align 1, !tbaa !5
  %15 = icmp eq i8 %14, 0
  %16 = select i1 %15, i32 46, i32 35
  %17 = tail call i32 @putchar(i32 %16)
  %18 = add nuw i64 %11, 1
  %19 = icmp eq i64 %18, %2
  br i1 %19, label %20, label %10, !llvm.loop !17

20:                                               ; preds = %10
  %21 = tail call i32 @putchar(i32 10)
  %22 = add nuw i64 %8, 1
  %23 = icmp eq i64 %22, %1
  br i1 %23, label %29, label %7, !llvm.loop !18

24:                                               ; preds = %5, %24
  %25 = phi i64 [ %27, %24 ], [ 0, %5 ]
  %26 = tail call i32 @putchar(i32 10)
  %27 = add nuw i64 %25, 1
  %28 = icmp eq i64 %27, %1
  br i1 %28, label %29, label %24, !llvm.loop !18

29:                                               ; preds = %20, %24, %3
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #4 {
  %3 = icmp slt i32 %0, 4
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = load ptr, ptr @stderr, align 8, !tbaa !10
  %6 = load ptr, ptr %1, align 8, !tbaa !10
  %7 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef nonnull @.str.4, ptr noundef %6) #14
  %8 = load ptr, ptr @stderr, align 8, !tbaa !10
  %9 = load ptr, ptr %1, align 8, !tbaa !10
  %10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef nonnull @.str.5, ptr noundef %9) #14
  tail call void @exit(i32 noundef 1) #15
  unreachable

11:                                               ; preds = %2
  %12 = getelementptr inbounds ptr, ptr %1, i64 1
  %13 = load ptr, ptr %12, align 8, !tbaa !10
  %14 = tail call i64 @strtol(ptr nocapture noundef nonnull %13, ptr noundef null, i32 noundef 10) #16
  %15 = getelementptr inbounds ptr, ptr %1, i64 2
  %16 = load ptr, ptr %15, align 8, !tbaa !10
  %17 = tail call i64 @strtol(ptr nocapture noundef nonnull %16, ptr noundef null, i32 noundef 10) #16
  %18 = shl i64 %17, 32
  %19 = ashr exact i64 %18, 32
  %20 = getelementptr inbounds ptr, ptr %1, i64 3
  %21 = load ptr, ptr %20, align 8, !tbaa !10
  %22 = tail call i64 @strtol(ptr nocapture noundef nonnull %21, ptr noundef null, i32 noundef 10) #16
  %23 = shl i64 %22, 32
  %24 = ashr exact i64 %23, 32
  %25 = ashr exact i64 %18, 29
  %26 = tail call noalias ptr @malloc(i64 noundef %25) #13
  %27 = icmp eq i64 %18, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %11
  %29 = tail call ptr @cellularAutomata(ptr noundef %26, i64 noundef %19, i64 noundef %24)
  br label %69

30:                                               ; preds = %11
  %31 = icmp eq i64 %23, 0
  br i1 %31, label %59, label %32

32:                                               ; preds = %30
  %33 = shl i64 %14, 32
  %34 = ashr exact i64 %33, 32
  br label %35

35:                                               ; preds = %32, %55
  %36 = phi i64 [ %46, %55 ], [ %34, %32 ]
  %37 = phi i64 [ %57, %55 ], [ 0, %32 ]
  %38 = tail call noalias ptr @malloc(i64 noundef %24) #13
  br label %39

39:                                               ; preds = %39, %35
  %40 = phi i64 [ %36, %35 ], [ %46, %39 ]
  %41 = phi i64 [ 0, %35 ], [ %53, %39 ]
  %42 = sdiv i64 %40, 200096
  %43 = add nsw i64 %42, %40
  %44 = mul i64 %43, -33554431
  %45 = sdiv i64 %44, 134217728
  %46 = add nsw i64 %45, %44
  %47 = mul nsw i64 %46, 2685821657736338717
  %48 = sdiv i64 %47, 4294967296
  %49 = and i64 %48, 1
  %50 = icmp eq i64 %49, 0
  %51 = zext i1 %50 to i8
  %52 = getelementptr inbounds i8, ptr %38, i64 %41
  store i8 %51, ptr %52, align 1, !tbaa !5
  %53 = add nuw i64 %41, 1
  %54 = icmp eq i64 %53, %24
  br i1 %54, label %55, label %39, !llvm.loop !8

55:                                               ; preds = %39
  %56 = getelementptr inbounds ptr, ptr %26, i64 %37
  store ptr %38, ptr %56, align 8, !tbaa !10
  %57 = add nuw i64 %37, 1
  %58 = icmp eq i64 %57, %19
  br i1 %58, label %65, label %35, !llvm.loop !12

59:                                               ; preds = %30, %59
  %60 = phi i64 [ %63, %59 ], [ 0, %30 ]
  %61 = tail call noalias ptr @malloc(i64 noundef 0) #13
  %62 = getelementptr inbounds ptr, ptr %26, i64 %60
  store ptr %61, ptr %62, align 8, !tbaa !10
  %63 = add nuw i64 %60, 1
  %64 = icmp eq i64 %63, %19
  br i1 %64, label %65, label %59, !llvm.loop !12

65:                                               ; preds = %55, %59
  %66 = tail call ptr @cellularAutomata(ptr noundef nonnull %26, i64 noundef %19, i64 noundef %24)
  br i1 %27, label %69, label %67

67:                                               ; preds = %65
  %68 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %74

69:                                               ; preds = %74, %28, %65
  %70 = phi ptr [ %29, %28 ], [ %66, %65 ], [ %66, %74 ]
  tail call void @free(ptr noundef %26) #16
  %71 = tail call ptr @cellularAutomata(ptr noundef %70, i64 noundef %19, i64 noundef %24)
  br i1 %27, label %80, label %72

72:                                               ; preds = %69
  %73 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %86

74:                                               ; preds = %67, %74
  %75 = phi i64 [ %78, %74 ], [ 0, %67 ]
  %76 = getelementptr inbounds ptr, ptr %26, i64 %75
  %77 = load ptr, ptr %76, align 8, !tbaa !10
  tail call void @free(ptr noundef %77) #16
  %78 = add nuw i64 %75, 1
  %79 = icmp eq i64 %78, %68
  br i1 %79, label %69, label %74, !llvm.loop !19

80:                                               ; preds = %86, %69
  tail call void @free(ptr noundef %70) #16
  %81 = getelementptr inbounds ptr, ptr %1, i64 4
  %82 = load ptr, ptr %81, align 8, !tbaa !10
  %83 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %82, ptr noundef nonnull dereferenceable(5) @.str.6, i64 noundef 4) #17
  %84 = icmp ne i32 %83, 0
  %85 = or i1 %27, %84
  br i1 %85, label %116, label %92

86:                                               ; preds = %72, %86
  %87 = phi i64 [ %90, %86 ], [ 0, %72 ]
  %88 = getelementptr inbounds ptr, ptr %70, i64 %87
  %89 = load ptr, ptr %88, align 8, !tbaa !10
  tail call void @free(ptr noundef %89) #16
  %90 = add nuw i64 %87, 1
  %91 = icmp eq i64 %90, %73
  br i1 %91, label %80, label %86, !llvm.loop !20

92:                                               ; preds = %80
  %93 = icmp eq i64 %23, 0
  br i1 %93, label %111, label %94

94:                                               ; preds = %92, %107
  %95 = phi i64 [ %109, %107 ], [ 0, %92 ]
  %96 = getelementptr inbounds ptr, ptr %71, i64 %95
  %97 = load ptr, ptr %96, align 8, !tbaa !10
  br label %98

98:                                               ; preds = %98, %94
  %99 = phi i64 [ 0, %94 ], [ %105, %98 ]
  %100 = getelementptr inbounds i8, ptr %97, i64 %99
  %101 = load i8, ptr %100, align 1, !tbaa !5
  %102 = icmp eq i8 %101, 0
  %103 = select i1 %102, i32 46, i32 35
  %104 = tail call i32 @putchar(i32 %103)
  %105 = add nuw i64 %99, 1
  %106 = icmp eq i64 %105, %24
  br i1 %106, label %107, label %98, !llvm.loop !17

107:                                              ; preds = %98
  %108 = tail call i32 @putchar(i32 10)
  %109 = add nuw i64 %95, 1
  %110 = icmp eq i64 %109, %19
  br i1 %110, label %116, label %94, !llvm.loop !18

111:                                              ; preds = %92, %111
  %112 = phi i64 [ %114, %111 ], [ 0, %92 ]
  %113 = tail call i32 @putchar(i32 10)
  %114 = add nuw i64 %112, 1
  %115 = icmp eq i64 %114, %19
  br i1 %115, label %116, label %111, !llvm.loop !18

116:                                              ; preds = %107, %111, %80
  br i1 %27, label %119, label %117

117:                                              ; preds = %116
  %118 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %120

119:                                              ; preds = %120, %116
  tail call void @free(ptr noundef %71) #16
  ret i32 0

120:                                              ; preds = %117, %120
  %121 = phi i64 [ %124, %120 ], [ 0, %117 ]
  %122 = getelementptr inbounds ptr, ptr %71, i64 %121
  %123 = load ptr, ptr %122, align 8, !tbaa !10
  tail call void @free(ptr noundef %123) #16
  %124 = add nuw i64 %121, 1
  %125 = icmp eq i64 %124, %118
  br i1 %125, label %119, label %120, !llvm.loop !21
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @strncmp(ptr nocapture noundef, ptr nocapture noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #10

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #10

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.usub.sat.i64(i64, i64) #10

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind memory(write, argmem: none, inaccessiblemem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nofree nounwind }
attributes #12 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #13 = { nounwind allocsize(0) }
attributes #14 = { cold }
attributes #15 = { noreturn nounwind }
attributes #16 = { nounwind }
attributes #17 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 16.0.0"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !6, i64 0}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
