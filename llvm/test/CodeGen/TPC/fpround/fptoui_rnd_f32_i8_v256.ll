; RUN: llc -march=tpc -mcpu=gaudi -O0 %s -o - | FileCheck %s

target triple = "tpc"

%struct._float64_quad_t = type { <64 x float>, <64 x float>, <64 x float>, <64 x float> }

; Function Attrs: noinline nounwind
define dso_local void @main() #0 {
; CHECK-DAG:    pack.u8 source_group=0 element_stride=4 %V{{[0-9]+}}, %V{{[0-9]+}}, %SP0
; CHECK-DAG:    pack.u8 source_group=1 element_stride=4 %V{{[0-9]+}}, %V{{[0-9]+}}, %SP0

; CHECK-DAG:    mov_dg src=1 dst=0 wr_lg=0x1 wr_ug=0x0 [[DEST:%V[0-9]+]], %V{{[0-9]+}}, -0x10000, %SP0
; CHECK-DAG:    mov_dg src=2 dst=0 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, 0xffff, %SP0
; CHECK-DAG:    mov_dg src=3 dst=0 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, -0x10000, %SP0
; CHECK-DAG:    mov_dg src=0 dst=1 wr_lg=0x1 wr_ug=0x0 [[DEST]], %V{{[0-9]+}}, 0xffff, %SP0
; CHECK-DAG:    mov_dg src=1 dst=1 wr_lg=0x1 wr_ug=0x0 [[DEST]], %V{{[0-9]+}}, -0x10000, %SP0
; CHECK-DAG:    mov_dg src=2 dst=1 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, 0xffff, %SP0
; CHECK-DAG:    mov_dg src=3 dst=1 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, -0x10000, %SP0

; CHECK-DAG:    pack.u8 source_group=0 element_stride=4 %V{{[0-9]+}}, %V{{[0-9]+}}, %SP0
; CHECK-DAG:    pack.u8 source_group=1 element_stride=4 %V{{[0-9]+}}, %V{{[0-9]+}}, %SP0

; CHECK-DAG:    mov_dg src=0 dst=2 wr_lg=0x1 wr_ug=0x0 [[DEST]], %V{{[0-9]+}}, 0xffff, %SP0
; CHECK-DAG:    mov_dg src=1 dst=2 wr_lg=0x1 wr_ug=0x0 [[DEST]], %V{{[0-9]+}}, -0x10000, %SP0
; CHECK-DAG:    mov_dg src=2 dst=2 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, 0xffff, %SP0
; CHECK-DAG:    mov_dg src=3 dst=2 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, -0x10000, %SP0

; CHECK-DAG:    pack.u8 source_group=0 element_stride=4 %V{{[0-9]+}}, %V{{[0-9]+}}, %SP0
; CHECK-DAG:    pack.u8 source_group=1 element_stride=4 %V{{[0-9]+}}, %V{{[0-9]+}}, %SP0

; CHECK-DAG:    mov_dg src=0 dst=3 wr_lg=0x1 wr_ug=0x0 [[DEST]], %V{{[0-9]+}}, 0xffff, %SP0
; CHECK-DAG:    mov_dg src=1 dst=3 wr_lg=0x1 wr_ug=0x0 [[DEST]], %V{{[0-9]+}}, -0x10000, %SP0
; CHECK-DAG:    mov_dg src=2 dst=3 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, 0xffff, %SP0
; CHECK-DAG:    mov_dg src=3 dst=3 wr_lg=0x0 wr_ug=0x1 [[DEST]], %V{{[0-9]+}}, -0x10000, %SP0
; CHECK:    st_tnsr 0x1, %I{{[0-9]+}}, [[DEST]], %SP0
entry:
  %vecins = call <5 x i32> @llvm.tpc.get.index.space.offset()
  %fp_source = bitcast %struct._float64_quad_t addrspace(2)* inttoptr (i32 0 to %struct._float64_quad_t addrspace(2)*) to <256 x float> addrspace(2)*
  %0 = load <256 x float>, <256 x float> addrspace(2)* %fp_source, align 256

  ;%1 = fptoui <256 x float> %0 to <256 x i8>
  %1 = tail call <256 x i8> @llvm.tpc.fptoui.swch.v256i8.v256f32(<256 x float> %0, i32 0)
  tail call void @llvm.tpc.st.tnsr.v256i8(<5 x i32> %vecins, i8 1, <256 x i8> %1, i32 0, i1 true, i1 false)

  ret void
}

; Function Attrs: nounwind readnone
declare <5 x i32> @llvm.tpc.get.index.space.offset() #1

; Function Attrs: nounwind readnone
declare <256 x i8> @llvm.tpc.fptoui.swch.v256i8.v256f32(<256 x float>, i32)

; Function Attrs: nounwind readnone
declare void @llvm.tpc.st.tnsr.v256i8(<5 x i32>, i8, <256 x i8>, i32, i1, i1) #2
