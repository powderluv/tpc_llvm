; RUN: llc -mcpu greco %s -o -  | FileCheck --check-prefixes=CHECK,GRECO %s
; RUN: llc -mcpu gaudi2 %s -o - | FileCheck --check-prefixes=CHECK,GRECO %s
; RUN: llc -mcpu gaudib %s -o - 
; RUN: llc -mcpu gaudi %s -o -  
; RUN: llc -mcpu goya %s -o -   

target triple = "tpc"

define void @main(i32 %dest, i32 %src, i32 %in, i32 %pred) {
entry:
  %sptr = inttoptr i32 %src to <256 x i8> addrspace(2)*
  %dptr = inttoptr i32 %dest to <256 x i32> addrspace(2)*
  %iptr = inttoptr i32 %in to <256 x i32> addrspace(2)*
  %spred = icmp ne i32 %pred, 0 
  %srcval = load <256 x i8>, <256 x i8> addrspace(2)* %sptr, align 256
  %inval = load <256 x i32>, <256 x i32> addrspace(2)* %iptr, align 256
  %dval = call <256 x i32> @llvm.tpc.convert.v256i16.v256i8.i1(<256 x i8> %srcval, i8 5, i32 768, <256 x i32> %inval, i1 %spred, i1 0)
  store <256 x i32> %dval, <256 x i32> addrspace(2)* %dptr, align 256
  ret void
}

declare <256 x i32> @llvm.tpc.convert.v256i16.v256i8.i1(<256 x i8>, i8, i32, <256 x i32>, i1, i1)

; CHECK-DAG: ld_l_v      [[VRF:%V[0-9]+]], %S1
; CHECK-DAG: cmp_neq.i32 [[SPRF:%SP[0-9]+]], %S3, 0x0
; CHECK-DAG: ld_l_v      %V[[ARF:[0-9]+]], %S2
; GRECO:     convert.u8  all_lanes target_type=uint32 rhne %A[[ARF]], [[VRF]], [[SPRF]]
; CHECK-DAG: st_l_v      %S0, %V[[ARF]]
; CHECK-DAG: st_l_v