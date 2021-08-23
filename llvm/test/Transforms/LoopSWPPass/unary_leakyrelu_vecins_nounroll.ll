; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -S -loop-swp -loop-software-pipelining=true | FileCheck %s

target triple = "tpc"

; Function Attrs: nounwind writeonly
define dso_local void @main(float %aboveZeroScale, float %belowZeroScale) local_unnamed_addr #0 {
; CHECK-LABEL: @main(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = tail call <5 x i32> @llvm.tpc.get.index.space.offset()
; CHECK-NEXT:    [[TMP1:%.*]] = tail call <5 x i32> @llvm.tpc.get.index.space.size()
; CHECK-NEXT:    [[ADD:%.*]] = add <5 x i32> [[TMP1]], [[TMP0]]
; CHECK-NEXT:    [[VECEXT:%.*]] = extractelement <5 x i32> [[TMP0]], i32 1
; CHECK-NEXT:    [[MUL:%.*]] = shl nsw i32 [[VECEXT]], 2
; CHECK-NEXT:    [[VECEXT1:%.*]] = extractelement <5 x i32> [[ADD]], i32 1
; CHECK-NEXT:    [[MUL2:%.*]] = shl i32 [[VECEXT1]], 2
; CHECK-NEXT:    [[VECEXT3:%.*]] = extractelement <5 x i32> [[TMP0]], i32 2
; CHECK-NEXT:    [[VECEXT4:%.*]] = extractelement <5 x i32> [[ADD]], i32 2
; CHECK-NEXT:    [[SPLAT_SPLATINSERT:%.*]] = insertelement <64 x float> undef, float [[ABOVEZEROSCALE:%.*]], i32 0
; CHECK-NEXT:    [[SPLAT_SPLAT:%.*]] = shufflevector <64 x float> [[SPLAT_SPLATINSERT]], <64 x float> undef, <64 x i32> zeroinitializer
; CHECK-NEXT:    [[SPLAT_SPLATINSERT5:%.*]] = insertelement <64 x float> undef, float [[BELOWZEROSCALE:%.*]], i32 0
; CHECK-NEXT:    [[SPLAT_SPLAT6:%.*]] = shufflevector <64 x float> [[SPLAT_SPLATINSERT5]], <64 x float> undef, <64 x i32> zeroinitializer
; CHECK-NEXT:    [[CMP49:%.*]] = icmp slt i32 [[VECEXT3]], [[VECEXT4]]
; CHECK-NEXT:    br i1 [[CMP49]], label [[FOR_BODY_LR_PH:%.*]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.body.lr.ph:
; CHECK-NEXT:    [[CMP846:%.*]] = icmp slt i32 [[MUL]], [[MUL2]]
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.cond.cleanup.loopexit:
; CHECK-NEXT:    br label [[FOR_COND_CLEANUP]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
; CHECK:       for.body:
; CHECK-NEXT:    [[H_051:%.*]] = phi i32 [ [[VECEXT3]], [[FOR_BODY_LR_PH]] ], [ [[ADD14:%.*]], [[FOR_COND_CLEANUP9:%.*]] ]
; CHECK-NEXT:    [[IFMCOORDS_050:%.*]] = phi <5 x i32> [ zeroinitializer, [[FOR_BODY_LR_PH]] ], [ [[IFMCOORDS_1_LCSSA:%.*]], [[FOR_COND_CLEANUP9]] ]
; CHECK-NEXT:    [[VECINS:%.*]] = insertelement <5 x i32> [[IFMCOORDS_050]], i32 [[H_051]], i32 2
; CHECK-NEXT:    br i1 [[CMP846]], label [[FOR_BODY10_PREHEADER:%.*]], label [[FOR_COND_CLEANUP9]]
; CHECK:       for.body10.preheader:
; CHECK-NEXT:    br label [[FOR_BODY10:%.*]]
; CHECK:       for.cond.cleanup9.loopexit:
; CHECK-NEXT:    [[VECINS11_LCSSA:%.*]] = phi <5 x i32> [ [[VECINS11:%.*]], [[FOR_BODY10]] ]
; CHECK-NEXT:    br label [[FOR_COND_CLEANUP9]]
; CHECK:       for.cond.cleanup9:
; CHECK-NEXT:    [[IFMCOORDS_1_LCSSA]] = phi <5 x i32> [ [[VECINS]], [[FOR_BODY]] ], [ [[VECINS11_LCSSA]], [[FOR_COND_CLEANUP9_LOOPEXIT:%.*]] ]
; CHECK-NEXT:    [[ADD14]] = add i32 [[H_051]], 1
; CHECK-NEXT:    [[EXITCOND52:%.*]] = icmp eq i32 [[ADD14]], [[VECEXT4]]
; CHECK-NEXT:    br i1 [[EXITCOND52]], label [[FOR_COND_CLEANUP_LOOPEXIT:%.*]], label [[FOR_BODY]]
; CHECK:       for.body10:
; CHECK-NEXT:    [[W_048:%.*]] = phi i32 [ [[ADD12:%.*]], [[FOR_BODY10]] ], [ [[MUL]], [[FOR_BODY10_PREHEADER]] ]
; CHECK-NEXT:    [[IFMCOORDS_147:%.*]] = phi <5 x i32> [ [[VECINS11]], [[FOR_BODY10]] ], [ [[VECINS]], [[FOR_BODY10_PREHEADER]] ]
; CHECK-NEXT:    [[VECINS11]] = insertelement <5 x i32> [[IFMCOORDS_147]], i32 [[W_048]], i32 1
; CHECK-NEXT:    [[TMP2:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[VECINS11]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP3:%.*]] = tail call <64 x float> @llvm.tpc.sel.grt.v64f32.v64f32.v64f32.v64f32.v64f32.i1(<64 x float> [[TMP2]], <64 x float> zeroinitializer, <64 x float> [[SPLAT_SPLAT]], <64 x float> [[SPLAT_SPLAT6]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP4:%.*]] = fmul <64 x float> [[TMP2]], [[TMP3]]
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[VECINS11]], i8 1, <64 x float> [[TMP4]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[ADD12]] = add i32 [[W_048]], 1
; CHECK-NEXT:    [[EXITCOND:%.*]] = icmp eq i32 [[ADD12]], [[MUL2]]
; CHECK-NEXT:    br i1 [[EXITCOND]], label [[FOR_COND_CLEANUP9_LOOPEXIT]], label [[FOR_BODY10]], !llvm.loop !3
;
entry:
  %0 = tail call <5 x i32> @llvm.tpc.get.index.space.offset()
  %1 = tail call <5 x i32> @llvm.tpc.get.index.space.size()
  %add = add <5 x i32> %1, %0
  %vecext = extractelement <5 x i32> %0, i32 1
  %mul = shl nsw i32 %vecext, 2
  %vecext1 = extractelement <5 x i32> %add, i32 1
  %mul2 = shl i32 %vecext1, 2
  %vecext3 = extractelement <5 x i32> %0, i32 2
  %vecext4 = extractelement <5 x i32> %add, i32 2
  %splat.splatinsert = insertelement <64 x float> undef, float %aboveZeroScale, i32 0
  %splat.splat = shufflevector <64 x float> %splat.splatinsert, <64 x float> undef, <64 x i32> zeroinitializer
  %splat.splatinsert5 = insertelement <64 x float> undef, float %belowZeroScale, i32 0
  %splat.splat6 = shufflevector <64 x float> %splat.splatinsert5, <64 x float> undef, <64 x i32> zeroinitializer
  %cmp49 = icmp slt i32 %vecext3, %vecext4
  br i1 %cmp49, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %cmp846 = icmp slt i32 %mul, %mul2
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup9
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret void

for.body:                                         ; preds = %for.cond.cleanup9, %for.body.lr.ph
  %h.051 = phi i32 [ %vecext3, %for.body.lr.ph ], [ %add14, %for.cond.cleanup9 ]
  %ifmCoords.050 = phi <5 x i32> [ zeroinitializer, %for.body.lr.ph ], [ %ifmCoords.1.lcssa, %for.cond.cleanup9 ]
  %vecins = insertelement <5 x i32> %ifmCoords.050, i32 %h.051, i32 2
  br i1 %cmp846, label %for.body10.preheader, label %for.cond.cleanup9

for.body10.preheader:                             ; preds = %for.body
  br label %for.body10

for.cond.cleanup9.loopexit:                       ; preds = %for.body10
  %vecins11.lcssa = phi <5 x i32> [ %vecins11, %for.body10 ]
  br label %for.cond.cleanup9

for.cond.cleanup9:                                ; preds = %for.cond.cleanup9.loopexit, %for.body
  %ifmCoords.1.lcssa = phi <5 x i32> [ %vecins, %for.body ], [ %vecins11.lcssa, %for.cond.cleanup9.loopexit ]
  %add14 = add i32 %h.051, 1
  %exitcond52 = icmp eq i32 %add14, %vecext4
  br i1 %exitcond52, label %for.cond.cleanup.loopexit, label %for.body

for.body10:                                       ; preds = %for.body10.preheader, %for.body10
  %w.048 = phi i32 [ %add12, %for.body10 ], [ %mul, %for.body10.preheader ]
  %ifmCoords.147 = phi <5 x i32> [ %vecins11, %for.body10 ], [ %vecins, %for.body10.preheader ]
  %vecins11 = insertelement <5 x i32> %ifmCoords.147, i32 %w.048, i32 1
  %2 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %vecins11, i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
  %3 = tail call <64 x float> @llvm.tpc.sel.grt.v64f32.v64f32.v64f32.v64f32.v64f32.i1(<64 x float> %2, <64 x float> zeroinitializer, <64 x float> %splat.splat, <64 x float> %splat.splat6, i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
  %4 = fmul <64 x float> %2, %3
  tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> %vecins11, i8 1, <64 x float> %4, i32 0, i1 true, i1 false)
  %add12 = add i32 %w.048, 1
  %exitcond = icmp eq i32 %add12, %mul2
  br i1 %exitcond, label %for.cond.cleanup9.loopexit, label %for.body10, !llvm.loop !3
}

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.get.index.space.offset() #1

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.get.index.space.size() #1

; Function Attrs: nounwind readnone
declare <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32>, i8, i32, <64 x float>, i1, i1) #1

; Function Attrs: nounwind readnone
declare <64 x float> @llvm.tpc.sel.grt.v64f32.v64f32.v64f32.v64f32.v64f32.i1(<64 x float>, <64 x float>, <64 x float>, <64 x float>, i8, i32, <64 x float>, i1, i1) #1

; Function Attrs: nounwind writeonly
declare void @llvm.tpc.st.tnsr.v64f32(<5 x i32>, i8, <64 x float>, i32, i1, i1) #2

attributes #0 = { nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="goya" "target-features"="+dali" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind writeonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!llvm.tpc.scalar_data = !{!2}
!llvm.tpc.vector_data = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (ssh://gerrit:29418/tpc_llvm10 4111c7f125204e995146f7741cc2c3989cfb74d0)"}
!2 = !{i32 0}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.taken", i1 true}