; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -march=tpc -mcpu=goya2 -coord-simplify -coord-update-simplify=true -S | FileCheck %s

target datalayout = "e-p0:32:32:32-p1:32:32:32-p2:32:32:32-p3:64:64:64-i32:32:32-n8:16:32-f16:16:16-f32:32:32-v160:32:32-v256:2048:2048-v2048:2048:2048-v4096:2048:2048-v8192:2048:2048"
target triple = "tpc"

; Function Attrs: nounwind writeonly
define dso_local void @main() local_unnamed_addr #0 {
; CHECK-LABEL: @main(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = tail call <5 x i32> @llvm.tpc.get.index.space.offset()
; CHECK-NEXT:    [[TMP1:%.*]] = tail call <5 x i32> @llvm.tpc.get.index.space.size()
; CHECK-NEXT:    [[ADD:%.*]] = add <5 x i32> [[TMP1]], [[TMP0]]
; CHECK-NEXT:    [[VECEXT:%.*]] = extractelement <5 x i32> [[TMP0]], i32 3
; CHECK-NEXT:    [[MUL:%.*]] = shl nsw i32 [[VECEXT]], 2
; CHECK-NEXT:    [[VECEXT1:%.*]] = extractelement <5 x i32> [[ADD]], i32 3
; CHECK-NEXT:    [[MUL2:%.*]] = shl i32 [[VECEXT1]], 2
; CHECK-NEXT:    [[VECEXT3:%.*]] = extractelement <5 x i32> [[TMP0]], i32 0
; CHECK-NEXT:    [[VECEXT4:%.*]] = extractelement <5 x i32> [[ADD]], i32 0
; CHECK-NEXT:    [[CMP47:%.*]] = icmp slt i32 [[VECEXT3]], [[VECEXT4]]
; CHECK-NEXT:    br i1 [[CMP47]], label [[FOR_BODY_LR_PH:%.*]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.body.lr.ph:
; CHECK-NEXT:    [[CMP744:%.*]] = icmp slt i32 [[MUL]], [[MUL2]]
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.cond.cleanup.loopexit:
; CHECK-NEXT:    br label [[FOR_COND_CLEANUP]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
; CHECK:       for.body:
; CHECK-NEXT:    [[H_049:%.*]] = phi i32 [ [[VECEXT3]], [[FOR_BODY_LR_PH]] ], [ [[ADD15:%.*]], [[FOR_COND_CLEANUP8:%.*]] ]
; CHECK-NEXT:    [[IFMCOORDS_048:%.*]] = phi <5 x i32> [ zeroinitializer, [[FOR_BODY_LR_PH]] ], [ [[IFMCOORDS_1_LCSSA:%.*]], [[FOR_COND_CLEANUP8]] ]
; CHECK-NEXT:    [[VECINS:%.*]] = insertelement <5 x i32> [[IFMCOORDS_048]], i32 [[H_049]], i32 0
; CHECK-NEXT:    [[VECINS5:%.*]] = insertelement <5 x i32> [[VECINS]], i32 [[MUL]], i32 3
; CHECK-NEXT:    br i1 [[CMP744]], label [[FOR_BODY9_PREHEADER:%.*]], label [[FOR_COND_CLEANUP8]]
; CHECK:       for.body9.preheader:
; CHECK-NEXT:    br label [[FOR_BODY9:%.*]]
; CHECK:       for.cond.cleanup8.loopexit:
; CHECK-NEXT:    [[DOTLCSSA:%.*]] = phi <5 x i32> [ [[TMP4:%.*]], [[FOR_BODY9]] ]
; CHECK-NEXT:    br label [[FOR_COND_CLEANUP8]]
; CHECK:       for.cond.cleanup8:
; CHECK-NEXT:    [[IFMCOORDS_1_LCSSA]] = phi <5 x i32> [ [[VECINS5]], [[FOR_BODY]] ], [ [[DOTLCSSA]], [[FOR_COND_CLEANUP8_LOOPEXIT:%.*]] ]
; CHECK-NEXT:    [[ADD15]] = add i32 [[H_049]], 1
; CHECK-NEXT:    [[EXITCOND50:%.*]] = icmp eq i32 [[ADD15]], [[VECEXT4]]
; CHECK-NEXT:    br i1 [[EXITCOND50]], label [[FOR_COND_CLEANUP_LOOPEXIT:%.*]], label [[FOR_BODY]], !llvm.loop !3
; CHECK:       for.body9:
; CHECK-NEXT:    [[W_046:%.*]] = phi i32 [ [[ADD13:%.*]], [[FOR_BODY9]] ], [ [[MUL]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[IFMCOORDS_145:%.*]] = phi <5 x i32> [ [[TMP4]], [[FOR_BODY9]] ], [ [[VECINS5]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP2:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[IFMCOORDS_145]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP3:%.*]] = tail call <64 x float> @llvm.fabs.v64f32(<64 x float> [[TMP2]])
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[IFMCOORDS_145]], i8 1, <64 x float> [[TMP3]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP4]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[IFMCOORDS_145]], i32 1, i32 8, i8 2, i32 0, <5 x i32> [[IFMCOORDS_145]], i1 true, i1 false)
; CHECK-NEXT:    [[ADD13]] = add i32 [[W_046]], 1
; CHECK-NEXT:    [[EXITCOND:%.*]] = icmp eq i32 [[ADD13]], [[MUL2]]
; CHECK-NEXT:    br i1 [[EXITCOND]], label [[FOR_COND_CLEANUP8_LOOPEXIT]], label [[FOR_BODY9]], !llvm.loop !5
;
entry:
  %0 = tail call <5 x i32> @llvm.tpc.get.index.space.offset()
  %1 = tail call <5 x i32> @llvm.tpc.get.index.space.size()
  %add = add <5 x i32> %1, %0
  %vecext = extractelement <5 x i32> %0, i32 3
  %mul = shl nsw i32 %vecext, 2
  %vecext1 = extractelement <5 x i32> %add, i32 3
  %mul2 = shl i32 %vecext1, 2
  %vecext3 = extractelement <5 x i32> %0, i32 0
  %vecext4 = extractelement <5 x i32> %add, i32 0
  %cmp47 = icmp slt i32 %vecext3, %vecext4
  br i1 %cmp47, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %cmp744 = icmp slt i32 %mul, %mul2
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup8
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret void

for.body:                                         ; preds = %for.cond.cleanup8, %for.body.lr.ph
  %h.049 = phi i32 [ %vecext3, %for.body.lr.ph ], [ %add15, %for.cond.cleanup8 ]
  %ifmCoords.048 = phi <5 x i32> [ zeroinitializer, %for.body.lr.ph ], [ %ifmCoords.1.lcssa, %for.cond.cleanup8 ]
  %vecins = insertelement <5 x i32> %ifmCoords.048, i32 %h.049, i32 0
  %vecins5 = insertelement <5 x i32> %vecins, i32 %mul, i32 3
  br i1 %cmp744, label %for.body9.preheader, label %for.cond.cleanup8

for.body9.preheader:                              ; preds = %for.body
  br label %for.body9

for.cond.cleanup8.loopexit:                       ; preds = %for.body9
  %.lcssa = phi <5 x i32> [ %4, %for.body9 ]
  br label %for.cond.cleanup8

for.cond.cleanup8:                                ; preds = %for.cond.cleanup8.loopexit, %for.body
  %ifmCoords.1.lcssa = phi <5 x i32> [ %vecins5, %for.body ], [ %.lcssa, %for.cond.cleanup8.loopexit ]
  %add15 = add i32 %h.049, 1
  %exitcond50 = icmp eq i32 %add15, %vecext4
  br i1 %exitcond50, label %for.cond.cleanup.loopexit, label %for.body, !llvm.loop !3

for.body9:                                        ; preds = %for.body9.preheader, %for.body9
  %w.046 = phi i32 [ %add13, %for.body9 ], [ %mul, %for.body9.preheader ]
  %ifmCoords.145 = phi <5 x i32> [ %4, %for.body9 ], [ %vecins5, %for.body9.preheader ]
  %2 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %ifmCoords.145, i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
  %3 = tail call <64 x float> @llvm.fabs.v64f32(<64 x float> %2)
  tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> %ifmCoords.145, i8 1, <64 x float> %3, i32 0, i1 true, i1 false)
  %4 = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> %ifmCoords.145, i32 1, i32 8, i8 2, i32 0, <5 x i32> %ifmCoords.145, i1 true, i1 false)
  %add13 = add i32 %w.046, 1
  %exitcond = icmp eq i32 %add13, %mul2
  br i1 %exitcond, label %for.cond.cleanup8.loopexit, label %for.body9, !llvm.loop !5
}

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.get.index.space.offset() #1

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.get.index.space.size() #1

; Function Attrs: nounwind readnone
declare <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32>, i8, i32, <64 x float>, i1, i1) #1

; Function Attrs: nounwind writeonly
declare void @llvm.tpc.st.tnsr.v64f32(<5 x i32>, i8, <64 x float>, i32, i1, i1) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare <64 x float> @llvm.fabs.v64f32(<64 x float>) #3

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32>, i32, i32, i8, i32, <5 x i32>, i1, i1) #1

attributes #0 = { nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="goya2" "target-features"="+goya2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind writeonly }
attributes #3 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!llvm.tpc.scalar_data = !{!2}
!llvm.tpc.vector_data = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (ssh://gerrit:29418/tpc_llvm10 37f6b84c5ee8bcfb48af5c8de6a680ad5a709a1d)"}
!2 = !{i32 0}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.taken", i1 true}
!5 = distinct !{!5, !4}