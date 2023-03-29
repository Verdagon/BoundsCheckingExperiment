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
  %5 = tail call noalias ptr @malloc(i64 noundef %4) #17
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %33, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  br i1 %8, label %34, label %9

9:                                                ; preds = %7, %29
  %10 = phi i64 [ %20, %29 ], [ %0, %7 ]
  %11 = phi i64 [ %31, %29 ], [ 0, %7 ]
  %12 = tail call noalias ptr @malloc(i64 noundef %2) #17
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
  %36 = tail call noalias ptr @malloc(i64 noundef 0) #17
  %37 = getelementptr inbounds ptr, ptr %5, i64 %35
  store ptr %36, ptr %37, align 8, !tbaa !10
  %38 = add nuw i64 %35, 1
  %39 = icmp eq i64 %38, %1
  br i1 %39, label %33, label %34, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none) uwtable
define dso_local signext i8 @lookup(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4) local_unnamed_addr #4 {
  %6 = getelementptr inbounds ptr, ptr %0, i64 %3
  %7 = load ptr, ptr %6, align 8, !tbaa !10
  %8 = getelementptr inbounds i8, ptr %7, i64 %4
  %9 = load i8, ptr %8, align 1, !tbaa !5
  ret i8 %9
}

; Function Attrs: nofree nounwind memory(readwrite, argmem: read) uwtable
define dso_local noalias ptr @cellularAutomata(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #5 {
  %4 = shl i64 %1, 3
  %5 = tail call noalias ptr @malloc(i64 noundef %4) #17
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %178, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  %9 = trunc i64 %1 to i32
  %10 = add i32 %9, -1
  %11 = trunc i64 %2 to i32
  %12 = add i32 %11, -1
  br i1 %8, label %179, label %13

13:                                               ; preds = %7, %173
  %14 = phi i32 [ %176, %173 ], [ -1, %7 ]
  %15 = phi i64 [ %175, %173 ], [ 0, %7 ]
  %16 = tail call i32 @llvm.smax.i32(i32 %14, i32 0)
  %17 = zext i32 %16 to i64
  %18 = tail call noalias ptr @malloc(i64 noundef %2) #17
  %19 = trunc i64 %15 to i32
  %20 = add i32 %19, -1
  %21 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %22 = add i32 %19, 1
  %23 = tail call i32 @llvm.smin.i32(i32 %10, i32 %22)
  %24 = icmp sgt i32 %21, %23
  %25 = getelementptr inbounds ptr, ptr %0, i64 %15
  br i1 %24, label %28, label %26

26:                                               ; preds = %13
  %27 = sext i32 %23 to i64
  br label %29

28:                                               ; preds = %13
  tail call void @llvm.memset.p0.i64(ptr align 1 %18, i8 0, i64 %2, i1 false), !tbaa !5
  br label %173

29:                                               ; preds = %26, %124
  %30 = phi i32 [ -1, %26 ], [ %128, %124 ]
  %31 = phi i64 [ 0, %26 ], [ %127, %124 ]
  %32 = trunc i64 %31 to i32
  %33 = add i32 %32, 1
  %34 = tail call i32 @llvm.smin.i32(i32 %33, i32 %12)
  %35 = sext i32 %34 to i64
  %36 = tail call i32 @llvm.smax.i32(i32 %30, i32 0)
  %37 = zext i32 %36 to i64
  %38 = tail call i64 @llvm.smax.i64(i64 %35, i64 %37)
  %39 = add nuw i64 %38, 1
  %40 = sub i64 %39, %37
  %41 = trunc i64 %31 to i32
  %42 = add i32 %41, 1
  %43 = tail call i32 @llvm.smin.i32(i32 %42, i32 %12)
  %44 = sext i32 %43 to i64
  %45 = trunc i64 %31 to i32
  %46 = add i32 %45, -1
  %47 = tail call i32 @llvm.smax.i32(i32 %46, i32 0)
  %48 = zext i32 %47 to i64
  %49 = tail call i64 @llvm.smax.i64(i64 %44, i64 %48)
  %50 = add nuw i64 %49, 1
  %51 = sub i64 %50, %48
  %52 = tail call i32 @llvm.smax.i32(i32 %30, i32 0)
  %53 = zext i32 %52 to i64
  %54 = trunc i64 %31 to i32
  %55 = add i32 %54, -1
  %56 = tail call i32 @llvm.smax.i32(i32 %55, i32 0)
  %57 = add i32 %54, 1
  %58 = tail call i32 @llvm.smin.i32(i32 %12, i32 %57)
  %59 = icmp sgt i32 %56, %58
  br i1 %59, label %124, label %60

60:                                               ; preds = %29
  %61 = sext i32 %58 to i64
  %62 = icmp ult i64 %51, 4
  %63 = and i64 %51, -4
  %64 = add i64 %63, %53
  %65 = icmp eq i64 %51, %63
  %66 = and i64 %40, 1
  %67 = icmp eq i64 %66, 0
  %68 = icmp eq i64 %31, %53
  %69 = add nuw nsw i64 %53, 1
  %70 = icmp slt i32 %36, %34
  br label %71

71:                                               ; preds = %60, %130
  %72 = phi i64 [ %17, %60 ], [ %132, %130 ]
  %73 = phi i64 [ 0, %60 ], [ %131, %130 ]
  %74 = icmp eq i64 %15, %72
  %75 = getelementptr inbounds ptr, ptr %0, i64 %72
  %76 = freeze i1 %74
  br i1 %76, label %77, label %134

77:                                               ; preds = %71
  %78 = select i1 %67, i1 true, i1 %68
  %79 = select i1 %67, i64 %53, i64 %69
  %80 = select i1 %67, i64 undef, i64 %73
  br i1 %78, label %88, label %81

81:                                               ; preds = %77
  %82 = load ptr, ptr %75, align 8, !tbaa !10
  %83 = getelementptr inbounds i8, ptr %82, i64 %53
  %84 = load i8, ptr %83, align 1, !tbaa !5
  %85 = icmp ne i8 %84, 0
  %86 = zext i1 %85 to i64
  %87 = add i64 %73, %86
  br label %88

88:                                               ; preds = %77, %81
  %89 = phi i64 [ %79, %77 ], [ %69, %81 ]
  %90 = phi i64 [ %73, %77 ], [ %87, %81 ]
  %91 = phi i64 [ %80, %77 ], [ %87, %81 ]
  br i1 %70, label %92, label %130

92:                                               ; preds = %88, %114
  %93 = phi i64 [ %116, %114 ], [ %89, %88 ]
  %94 = phi i64 [ %115, %114 ], [ %90, %88 ]
  %95 = icmp eq i64 %31, %93
  br i1 %95, label %103, label %96

96:                                               ; preds = %92
  %97 = load ptr, ptr %75, align 8, !tbaa !10
  %98 = getelementptr inbounds i8, ptr %97, i64 %93
  %99 = load i8, ptr %98, align 1, !tbaa !5
  %100 = icmp ne i8 %99, 0
  %101 = zext i1 %100 to i64
  %102 = add i64 %94, %101
  br label %103

103:                                              ; preds = %96, %92
  %104 = phi i64 [ %94, %92 ], [ %102, %96 ]
  %105 = add nuw nsw i64 %93, 1
  %106 = icmp eq i64 %31, %105
  br i1 %106, label %114, label %107

107:                                              ; preds = %103
  %108 = load ptr, ptr %75, align 8, !tbaa !10
  %109 = getelementptr inbounds i8, ptr %108, i64 %105
  %110 = load i8, ptr %109, align 1, !tbaa !5
  %111 = icmp ne i8 %110, 0
  %112 = zext i1 %111 to i64
  %113 = add i64 %104, %112
  br label %114

114:                                              ; preds = %107, %103
  %115 = phi i64 [ %104, %103 ], [ %113, %107 ]
  %116 = add nuw nsw i64 %93, 2
  %117 = icmp slt i64 %105, %61
  br i1 %117, label %92, label %130, !llvm.loop !13

118:                                              ; preds = %171
  %119 = icmp eq i64 %131, 4
  br i1 %119, label %120, label %124

120:                                              ; preds = %118
  %121 = load ptr, ptr %25, align 8, !tbaa !10
  %122 = getelementptr inbounds i8, ptr %121, i64 %31
  %123 = load i8, ptr %122, align 1, !tbaa !5
  br label %124

124:                                              ; preds = %29, %171, %120, %118
  %125 = phi i8 [ %123, %120 ], [ 0, %171 ], [ 1, %118 ], [ 0, %29 ]
  %126 = getelementptr inbounds i8, ptr %18, i64 %31
  store i8 %125, ptr %126, align 1, !tbaa !5
  %127 = add nuw i64 %31, 1
  %128 = add i32 %30, 1
  %129 = icmp eq i64 %127, %2
  br i1 %129, label %173, label %29, !llvm.loop !14

130:                                              ; preds = %161, %88, %114, %155
  %131 = phi i64 [ %157, %155 ], [ %91, %88 ], [ %115, %114 ], [ %168, %161 ]
  %132 = add nuw nsw i64 %72, 1
  %133 = icmp slt i64 %72, %27
  br i1 %133, label %71, label %171, !llvm.loop !15

134:                                              ; preds = %71
  %135 = load ptr, ptr %75, align 8, !tbaa !10
  br i1 %62, label %158, label %136

136:                                              ; preds = %134
  %137 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %73, i64 0
  br label %138

138:                                              ; preds = %138, %136
  %139 = phi i64 [ 0, %136 ], [ %153, %138 ]
  %140 = phi <2 x i64> [ %137, %136 ], [ %151, %138 ]
  %141 = phi <2 x i64> [ zeroinitializer, %136 ], [ %152, %138 ]
  %142 = add i64 %139, %53
  %143 = getelementptr inbounds i8, ptr %135, i64 %142
  %144 = load <2 x i8>, ptr %143, align 1, !tbaa !5
  %145 = getelementptr inbounds i8, ptr %143, i64 2
  %146 = load <2 x i8>, ptr %145, align 1, !tbaa !5
  %147 = icmp ne <2 x i8> %144, zeroinitializer
  %148 = icmp ne <2 x i8> %146, zeroinitializer
  %149 = zext <2 x i1> %147 to <2 x i64>
  %150 = zext <2 x i1> %148 to <2 x i64>
  %151 = add <2 x i64> %140, %149
  %152 = add <2 x i64> %141, %150
  %153 = add nuw i64 %139, 4
  %154 = icmp eq i64 %153, %63
  br i1 %154, label %155, label %138, !llvm.loop !16

155:                                              ; preds = %138
  %156 = add <2 x i64> %152, %151
  %157 = tail call i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %156)
  br i1 %65, label %130, label %158

158:                                              ; preds = %134, %155
  %159 = phi i64 [ %53, %134 ], [ %64, %155 ]
  %160 = phi i64 [ %73, %134 ], [ %157, %155 ]
  br label %161

161:                                              ; preds = %158, %161
  %162 = phi i64 [ %169, %161 ], [ %159, %158 ]
  %163 = phi i64 [ %168, %161 ], [ %160, %158 ]
  %164 = getelementptr inbounds i8, ptr %135, i64 %162
  %165 = load i8, ptr %164, align 1, !tbaa !5
  %166 = icmp ne i8 %165, 0
  %167 = zext i1 %166 to i64
  %168 = add i64 %163, %167
  %169 = add nuw nsw i64 %162, 1
  %170 = icmp slt i64 %162, %61
  br i1 %170, label %161, label %130, !llvm.loop !19

171:                                              ; preds = %130
  %172 = icmp ult i64 %131, 4
  br i1 %172, label %124, label %118

173:                                              ; preds = %124, %28
  %174 = getelementptr inbounds ptr, ptr %5, i64 %15
  store ptr %18, ptr %174, align 8, !tbaa !10
  %175 = add nuw i64 %15, 1
  %176 = add i32 %14, 1
  %177 = icmp eq i64 %175, %1
  br i1 %177, label %178, label %13, !llvm.loop !20

178:                                              ; preds = %173, %179, %3
  ret ptr %5

179:                                              ; preds = %7, %179
  %180 = phi i64 [ %183, %179 ], [ 0, %7 ]
  %181 = tail call noalias ptr @malloc(i64 noundef 0) #17
  %182 = getelementptr inbounds ptr, ptr %5, i64 %180
  store ptr %181, ptr %182, align 8, !tbaa !10
  %183 = add nuw i64 %180, 1
  %184 = icmp eq i64 %183, %1
  br i1 %184, label %178, label %179, !llvm.loop !20
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @display(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #6 {
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
  br i1 %19, label %20, label %10, !llvm.loop !21

20:                                               ; preds = %10
  %21 = tail call i32 @putchar(i32 10)
  %22 = add nuw i64 %8, 1
  %23 = icmp eq i64 %22, %1
  br i1 %23, label %29, label %7, !llvm.loop !22

24:                                               ; preds = %5, %24
  %25 = phi i64 [ %27, %24 ], [ 0, %5 ]
  %26 = tail call i32 @putchar(i32 10)
  %27 = add nuw i64 %25, 1
  %28 = icmp eq i64 %27, %1
  br i1 %28, label %29, label %24, !llvm.loop !22

29:                                               ; preds = %20, %24, %3
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #7 {
  %3 = icmp slt i32 %0, 4
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = load ptr, ptr @stderr, align 8, !tbaa !10
  %6 = load ptr, ptr %1, align 8, !tbaa !10
  %7 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef nonnull @.str.3, ptr noundef %6) #18
  %8 = load ptr, ptr @stderr, align 8, !tbaa !10
  %9 = load ptr, ptr %1, align 8, !tbaa !10
  %10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef nonnull @.str.4, ptr noundef %9) #18
  tail call void @exit(i32 noundef 1) #19
  unreachable

11:                                               ; preds = %2
  %12 = getelementptr inbounds ptr, ptr %1, i64 1
  %13 = load ptr, ptr %12, align 8, !tbaa !10
  %14 = tail call i64 @strtol(ptr nocapture noundef nonnull %13, ptr noundef null, i32 noundef 10) #20
  %15 = getelementptr inbounds ptr, ptr %1, i64 2
  %16 = load ptr, ptr %15, align 8, !tbaa !10
  %17 = tail call i64 @strtol(ptr nocapture noundef nonnull %16, ptr noundef null, i32 noundef 10) #20
  %18 = shl i64 %17, 32
  %19 = ashr exact i64 %18, 32
  %20 = getelementptr inbounds ptr, ptr %1, i64 3
  %21 = load ptr, ptr %20, align 8, !tbaa !10
  %22 = tail call i64 @strtol(ptr nocapture noundef nonnull %21, ptr noundef null, i32 noundef 10) #20
  %23 = shl i64 %22, 32
  %24 = ashr exact i64 %23, 32
  %25 = ashr exact i64 %18, 29
  %26 = tail call noalias ptr @malloc(i64 noundef %25) #17
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
  %38 = tail call noalias ptr @malloc(i64 noundef %24) #17
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
  %61 = tail call noalias ptr @malloc(i64 noundef 0) #17
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
  tail call void @free(ptr noundef %26) #20
  %71 = tail call ptr @cellularAutomata(ptr noundef %70, i64 noundef %19, i64 noundef %24)
  br i1 %27, label %80, label %72

72:                                               ; preds = %69
  %73 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %86

74:                                               ; preds = %67, %74
  %75 = phi i64 [ %78, %74 ], [ 0, %67 ]
  %76 = getelementptr inbounds ptr, ptr %26, i64 %75
  %77 = load ptr, ptr %76, align 8, !tbaa !10
  tail call void @free(ptr noundef %77) #20
  %78 = add nuw i64 %75, 1
  %79 = icmp eq i64 %78, %68
  br i1 %79, label %69, label %74, !llvm.loop !23

80:                                               ; preds = %86, %69
  tail call void @free(ptr noundef %70) #20
  %81 = getelementptr inbounds ptr, ptr %1, i64 4
  %82 = load ptr, ptr %81, align 8, !tbaa !10
  %83 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %82, ptr noundef nonnull dereferenceable(5) @.str.5, i64 noundef 4) #21
  %84 = icmp ne i32 %83, 0
  %85 = or i1 %27, %84
  br i1 %85, label %116, label %92

86:                                               ; preds = %72, %86
  %87 = phi i64 [ %90, %86 ], [ 0, %72 ]
  %88 = getelementptr inbounds ptr, ptr %70, i64 %87
  %89 = load ptr, ptr %88, align 8, !tbaa !10
  tail call void @free(ptr noundef %89) #20
  %90 = add nuw i64 %87, 1
  %91 = icmp eq i64 %90, %73
  br i1 %91, label %80, label %86, !llvm.loop !24

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
  br i1 %106, label %107, label %98, !llvm.loop !21

107:                                              ; preds = %98
  %108 = tail call i32 @putchar(i32 10)
  %109 = add nuw i64 %95, 1
  %110 = icmp eq i64 %109, %19
  br i1 %110, label %116, label %94, !llvm.loop !22

111:                                              ; preds = %92, %111
  %112 = phi i64 [ %114, %111 ], [ 0, %92 ]
  %113 = tail call i32 @putchar(i32 10)
  %114 = add nuw i64 %112, 1
  %115 = icmp eq i64 %114, %19
  br i1 %115, label %116, label %111, !llvm.loop !22

116:                                              ; preds = %107, %111, %80
  br i1 %27, label %119, label %117

117:                                              ; preds = %116
  %118 = tail call i64 @llvm.umax.i64(i64 %19, i64 1)
  br label %120

119:                                              ; preds = %120, %116
  tail call void @free(ptr noundef %71) #20
  ret i32 0

120:                                              ; preds = %117, %120
  %121 = phi i64 [ %124, %120 ], [ 0, %117 ]
  %122 = getelementptr inbounds ptr, ptr %71, i64 %121
  %123 = load ptr, ptr %122, align 8, !tbaa !10
  tail call void @free(ptr noundef %123) #20
  %124 = add nuw i64 %121, 1
  %125 = icmp eq i64 %124, %118
  br i1 %125, label %119, label %120, !llvm.loop !25
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #13

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v2i64(<2 x i64>) #16

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
attributes #15 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #16 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #17 = { nounwind allocsize(0) }
attributes #18 = { cold }
attributes #19 = { noreturn nounwind }
attributes #20 = { nounwind }
attributes #21 = { nounwind willreturn memory(read) }

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
!16 = distinct !{!16, !9, !17, !18}
!17 = !{!"llvm.loop.isvectorized", i32 1}
!18 = !{!"llvm.loop.unroll.runtime.disable"}
!19 = distinct !{!19, !9, !18, !17}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
!22 = distinct !{!22, !9}
!23 = distinct !{!23, !9}
!24 = distinct !{!24, !9}
!25 = distinct !{!25, !9}
