; RUN: llc -mcpu gaudi2 %s -o - | FileCheck %s

target triple = "tpc"

define void @main(f8_152 %x0, float %res0, i32 %dest, i1 zeroext %pred) {
entry:
  %0 = inttoptr i32 %dest to float addrspace(1)*
  %1 = call float @llvm.tpc.mac.f32.f8_152.i1(f8_152 %x0, f8_152 1.0, i8 12, i32 0, float %res0, i1 %pred, i1 false)
  store float %1, float addrspace(1)* %0, align 4
  ret void
}

; Function Attrs: nounwind readnone
declare float @llvm.tpc.mac.f32.f8_152.i1(f8_152, f8_152, i8, i32, float, i1, i1)

; CHECK: mov         [[PRED:%SP[0-9]+]], %S3
; CHECK: mac.f8_152  %S1, %S0, 0x3c, [[PRED]]
; CHECK: st_l        %S2, %S1