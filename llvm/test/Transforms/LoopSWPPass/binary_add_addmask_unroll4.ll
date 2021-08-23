; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -S -loop-swp -loop-software-pipelining=true | FileCheck %s

target triple = "tpc"

; Function Attrs: nounwind writeonly
define dso_local void @main() local_unnamed_addr #0 {
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
; CHECK-NEXT:    [[CMP51:%.*]] = icmp slt i32 [[VECEXT3]], [[VECEXT4]]
; CHECK-NEXT:    br i1 [[CMP51]], label [[FOR_BODY_LR_PH:%.*]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.body.lr.ph:
; CHECK-NEXT:    [[CMP748:%.*]] = icmp slt i32 [[MUL]], [[MUL2]]
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.cond.cleanup.loopexit:
; CHECK-NEXT:    br label [[FOR_COND_CLEANUP]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
; CHECK:       for.body:
; CHECK-NEXT:    [[H_053:%.*]] = phi i32 [ [[VECEXT3]], [[FOR_BODY_LR_PH]] ], [ [[ADD15:%.*]], [[FOR_COND_CLEANUP8:%.*]] ]
; CHECK-NEXT:    [[IFMCOORDS_052:%.*]] = phi <5 x i32> [ zeroinitializer, [[FOR_BODY_LR_PH]] ], [ [[IFMCOORDS_1_LCSSA:%.*]], [[FOR_COND_CLEANUP8]] ]
; CHECK-NEXT:    [[VECINS:%.*]] = insertelement <5 x i32> [[IFMCOORDS_052]], i32 [[H_053]], i32 2
; CHECK-NEXT:    [[VECINS5:%.*]] = insertelement <5 x i32> [[VECINS]], i32 [[MUL]], i32 1
; CHECK-NEXT:    br i1 [[CMP748]], label [[FOR_BODY9_PREHEADER:%.*]], label [[FOR_COND_CLEANUP8]]
; CHECK:       for.body9.preheader:
; CHECK-NEXT:    [[TMP2:%.*]] = phi i32 [ [[MUL]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[TMP3:%.*]] = phi <5 x i32> [ [[VECINS5]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[TMP4:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP3]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP5:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP3]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP6:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP3]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP3]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP7:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP6]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP8:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP6]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP9:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP6]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP6]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP10:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP9]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP11:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP9]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP12:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP9]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP9]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP13:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP12]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP14:%.*]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP12]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP15:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP12]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP12]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP16:%.*]] = add i32 [[TMP2]], 4
; CHECK-NEXT:    [[TMP17:%.*]] = icmp eq i32 [[TMP16]], [[MUL2]]
; CHECK-NEXT:    br i1 [[TMP17]], label [[FOR_COND_CLEANUP8_LOOPEXIT:%.*]], label [[FOR_BODY9:%.*]]
; CHECK:       for.cond.cleanup8.loopexit:
; CHECK-NEXT:    [[TMP18:%.*]] = phi <5 x i32> [ [[VECINS5]], [[FOR_BODY9_PREHEADER]] ], [ [[TMP62:%.*]], [[FOR_BODY9]] ]
; CHECK-NEXT:    [[DOTLCSSA:%.*]] = phi <5 x i32> [ [[TMP63:%.*]], [[FOR_BODY9]] ], [ [[TMP15]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP19:%.*]] = phi <64 x float> [ [[TMP44:%.*]], [[FOR_BODY9]] ], [ [[TMP4]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP20:%.*]] = phi <64 x float> [ [[TMP45:%.*]], [[FOR_BODY9]] ], [ [[TMP5]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP21:%.*]] = phi <64 x float> [ [[TMP49:%.*]], [[FOR_BODY9]] ], [ [[TMP7]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP22:%.*]] = phi <64 x float> [ [[TMP50:%.*]], [[FOR_BODY9]] ], [ [[TMP8]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP23:%.*]] = phi <64 x float> [ [[TMP54:%.*]], [[FOR_BODY9]] ], [ [[TMP10]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP24:%.*]] = phi <64 x float> [ [[TMP55:%.*]], [[FOR_BODY9]] ], [ [[TMP11]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP25:%.*]] = phi <64 x float> [ [[TMP59:%.*]], [[FOR_BODY9]] ], [ [[TMP13]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP26:%.*]] = phi <64 x float> [ [[TMP60:%.*]], [[FOR_BODY9]] ], [ [[TMP14]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP27:%.*]] = fadd <64 x float> [[TMP19]], [[TMP20]]
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP18]], i8 2, <64 x float> [[TMP27]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP28:%.*]] = fadd <64 x float> [[TMP21]], [[TMP22]]
; CHECK-NEXT:    [[TMP29:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP18]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP18]], i1 true, i1 false)
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP29]], i8 2, <64 x float> [[TMP28]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP30:%.*]] = fadd <64 x float> [[TMP23]], [[TMP24]]
; CHECK-NEXT:    [[TMP31:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP29]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP29]], i1 true, i1 false)
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP31]], i8 2, <64 x float> [[TMP30]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP32:%.*]] = fadd <64 x float> [[TMP25]], [[TMP26]]
; CHECK-NEXT:    [[TMP33:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP31]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP31]], i1 true, i1 false)
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP33]], i8 2, <64 x float> [[TMP32]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP34:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP33]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP33]], i1 true, i1 false)
; CHECK-NEXT:    br label [[FOR_COND_CLEANUP8]]
; CHECK:       for.cond.cleanup8:
; CHECK-NEXT:    [[IFMCOORDS_1_LCSSA]] = phi <5 x i32> [ [[VECINS5]], [[FOR_BODY]] ], [ [[DOTLCSSA]], [[FOR_COND_CLEANUP8_LOOPEXIT]] ]
; CHECK-NEXT:    [[ADD15]] = add i32 [[H_053]], 1
; CHECK-NEXT:    [[EXITCOND54:%.*]] = icmp eq i32 [[ADD15]], [[VECEXT4]]
; CHECK-NEXT:    br i1 [[EXITCOND54]], label [[FOR_COND_CLEANUP_LOOPEXIT:%.*]], label [[FOR_BODY]]
; CHECK:       for.body9:
; CHECK-NEXT:    [[TMP35:%.*]] = phi <64 x float> [ [[TMP44]], [[FOR_BODY9]] ], [ [[TMP4]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP36:%.*]] = phi <64 x float> [ [[TMP45]], [[FOR_BODY9]] ], [ [[TMP5]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP37:%.*]] = phi <64 x float> [ [[TMP49]], [[FOR_BODY9]] ], [ [[TMP7]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP38:%.*]] = phi <64 x float> [ [[TMP50]], [[FOR_BODY9]] ], [ [[TMP8]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP39:%.*]] = phi <64 x float> [ [[TMP54]], [[FOR_BODY9]] ], [ [[TMP10]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP40:%.*]] = phi <64 x float> [ [[TMP55]], [[FOR_BODY9]] ], [ [[TMP11]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP41:%.*]] = phi <64 x float> [ [[TMP59]], [[FOR_BODY9]] ], [ [[TMP13]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP42:%.*]] = phi <64 x float> [ [[TMP60]], [[FOR_BODY9]] ], [ [[TMP14]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP43:%.*]] = phi <5 x i32> [ [[VECINS5]], [[FOR_BODY9_PREHEADER]] ], [ [[TMP62]], [[FOR_BODY9]] ]
; CHECK-NEXT:    [[W_050:%.*]] = phi i32 [ [[ADD13_3:%.*]], [[FOR_BODY9]] ], [ [[TMP16]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[IFMCOORDS_149:%.*]] = phi <5 x i32> [ [[TMP63]], [[FOR_BODY9]] ], [ [[TMP15]], [[FOR_BODY9_PREHEADER]] ]
; CHECK-NEXT:    [[TMP44]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[IFMCOORDS_149]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP45]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[IFMCOORDS_149]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP46:%.*]] = fadd <64 x float> [[TMP35]], [[TMP36]]
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP43]], i8 2, <64 x float> [[TMP46]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP47:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP43]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP43]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP48:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[IFMCOORDS_149]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[IFMCOORDS_149]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP49]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP48]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP50]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP48]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP51:%.*]] = fadd <64 x float> [[TMP37]], [[TMP38]]
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP47]], i8 2, <64 x float> [[TMP51]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP52:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP47]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP47]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP53:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP48]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP48]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP54]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP53]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP55]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP53]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP56:%.*]] = fadd <64 x float> [[TMP39]], [[TMP40]]
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP52]], i8 2, <64 x float> [[TMP56]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP57:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP52]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP52]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP58:%.*]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP53]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP53]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP59]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP58]], i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP60]] = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> [[TMP58]], i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
; CHECK-NEXT:    [[TMP61:%.*]] = fadd <64 x float> [[TMP41]], [[TMP42]]
; CHECK-NEXT:    tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> [[TMP57]], i8 2, <64 x float> [[TMP61]], i32 0, i1 true, i1 false)
; CHECK-NEXT:    [[TMP62]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP57]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP57]], i1 true, i1 false)
; CHECK-NEXT:    [[TMP63]] = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> [[TMP58]], i32 1, i32 2, i8 2, i32 0, <5 x i32> [[TMP58]], i1 true, i1 false)
; CHECK-NEXT:    [[ADD13_3]] = add i32 [[W_050]], 4
; CHECK-NEXT:    [[EXITCOND_3:%.*]] = icmp eq i32 [[ADD13_3]], [[MUL2]]
; CHECK-NEXT:    br i1 [[EXITCOND_3]], label [[FOR_COND_CLEANUP8_LOOPEXIT]], label [[FOR_BODY9]], !llvm.loop !3
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
  %cmp51 = icmp slt i32 %vecext3, %vecext4
  br i1 %cmp51, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %cmp748 = icmp slt i32 %mul, %mul2
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup8
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret void

for.body:                                         ; preds = %for.cond.cleanup8, %for.body.lr.ph
  %h.053 = phi i32 [ %vecext3, %for.body.lr.ph ], [ %add15, %for.cond.cleanup8 ]
  %ifmCoords.052 = phi <5 x i32> [ zeroinitializer, %for.body.lr.ph ], [ %ifmCoords.1.lcssa, %for.cond.cleanup8 ]
  %vecins = insertelement <5 x i32> %ifmCoords.052, i32 %h.053, i32 2
  %vecins5 = insertelement <5 x i32> %vecins, i32 %mul, i32 1
  br i1 %cmp748, label %for.body9.preheader, label %for.cond.cleanup8

for.body9.preheader:                              ; preds = %for.body
  br label %for.body9

for.cond.cleanup8.loopexit:                       ; preds = %for.body9
  %.lcssa = phi <5 x i32> [ %17, %for.body9 ]
  br label %for.cond.cleanup8

for.cond.cleanup8:                                ; preds = %for.cond.cleanup8.loopexit, %for.body
  %ifmCoords.1.lcssa = phi <5 x i32> [ %vecins5, %for.body ], [ %.lcssa, %for.cond.cleanup8.loopexit ]
  %add15 = add i32 %h.053, 1
  %exitcond54 = icmp eq i32 %add15, %vecext4
  br i1 %exitcond54, label %for.cond.cleanup.loopexit, label %for.body

for.body9:                                        ; preds = %for.body9.preheader, %for.body9
  %w.050 = phi i32 [ %add13.3, %for.body9 ], [ %mul, %for.body9.preheader ]
  %ifmCoords.149 = phi <5 x i32> [ %17, %for.body9 ], [ %vecins5, %for.body9.preheader ]
  %2 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %ifmCoords.149, i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
  %3 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %ifmCoords.149, i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
  %4 = fadd <64 x float> %2, %3
  tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> %ifmCoords.149, i8 2, <64 x float> %4, i32 0, i1 true, i1 false)
  %5 = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> %ifmCoords.149, i32 1, i32 2, i8 2, i32 0, <5 x i32> %ifmCoords.149, i1 true, i1 false)
  %6 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %5, i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
  %7 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %5, i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
  %8 = fadd <64 x float> %6, %7
  tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> %5, i8 2, <64 x float> %8, i32 0, i1 true, i1 false)
  %9 = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> %5, i32 1, i32 2, i8 2, i32 0, <5 x i32> %5, i1 true, i1 false)
  %10 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %9, i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
  %11 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %9, i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
  %12 = fadd <64 x float> %10, %11
  tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> %9, i8 2, <64 x float> %12, i32 0, i1 true, i1 false)
  %13 = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> %9, i32 1, i32 2, i8 2, i32 0, <5 x i32> %9, i1 true, i1 false)
  %14 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %13, i8 0, i32 0, <64 x float> undef, i1 true, i1 false)
  %15 = tail call <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32> %13, i8 1, i32 0, <64 x float> undef, i1 true, i1 false)
  %16 = fadd <64 x float> %14, %15
  tail call void @llvm.tpc.st.tnsr.v64f32(<5 x i32> %13, i8 2, <64 x float> %16, i32 0, i1 true, i1 false)
  %17 = tail call <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32> %13, i32 1, i32 2, i8 2, i32 0, <5 x i32> %13, i1 true, i1 false)
  %add13.3 = add i32 %w.050, 4
  %exitcond.3 = icmp eq i32 %add13.3, %mul2
  br i1 %exitcond.3, label %for.cond.cleanup8.loopexit, label %for.body9, !llvm.loop !3
}

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.get.index.space.offset() #1

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.get.index.space.size() #1

; Function Attrs: nounwind readnone
declare <64 x float> @llvm.tpc.ld.tnsr.v64f32.i1(<5 x i32>, i8, i32, <64 x float>, i1, i1) #1

; Function Attrs: nounwind writeonly
declare void @llvm.tpc.st.tnsr.v64f32(<5 x i32>, i8, <64 x float>, i32, i1, i1) #2

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.add.mask.v5i32.i32(<5 x i32>, i32, i32, i8, i32, <5 x i32>, i1, i1) #1

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
!4 = !{!"llvm.loop.unroll.disable"}