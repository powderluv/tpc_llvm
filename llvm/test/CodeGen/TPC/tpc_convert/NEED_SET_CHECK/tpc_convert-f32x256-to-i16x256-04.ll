; RUN: llc -mcpu greco %s -o -  | FileCheck --check-prefixes=CHECK,GRECO %s
; RUN: llc -mcpu gaudi2 %s -o - | FileCheck --check-prefixes=CHECK,GAUDI2 %s
; RUN: llc -mcpu gaudib %s -o - 
; RUN: llc -mcpu gaudi %s -o -  
; RUN: llc -mcpu goya %s -o -   

target triple = "tpc"

define void @main(i32 %dest, i32 %src, i32 %in, i32 %pred) {
entry:
  %sptr = inttoptr i32 %src to <256 x float> addrspace(2)*
  %dptr = inttoptr i32 %dest to <256 x i16> addrspace(2)*
  %iptr = inttoptr i32 %in to <256 x i16> addrspace(2)*
  %spred = icmp ne i32 %pred, 0 
  %srcval = load <256 x float>, <256 x float> addrspace(2)* %sptr, align 256
  %inval = load <256 x i16>, <256 x i16> addrspace(2)* %iptr, align 256
  %dval = call <256 x i16> @llvm.tpc.convert.v256i16.v256f32.i1(<256 x float> %srcval, i8 0, i32 1792, <256 x i16> %inval, i1 %spred, i1 0)
  store <256 x i16> %dval, <256 x i16> addrspace(2)* %dptr, align 256
  ret void
}

; CHECK:     ld_l_v     [[VRF:%V[0-9]+]], %S1
; GRECO:    convert.f32 all_lanes target_type=int16 rhne
; GAUDI2:   convert.f32 all_lanes target_type=int16 rhne
; CHECK-DAG: st_l_v     %S0, %V{{[0-9]+}}



declare <256 x i16> @llvm.tpc.convert.v256i16.v256f32.i1(<256 x float>, i8, i32, <256 x i16>, i1, i1)

;| FileCheck --check-prefixes=CHECK,GRECO %s  
;| FileCheck --check-prefixes=CHECK,GAUDI2 %s 
;| FileCheck --check-prefixes=CHECK,GAUDIB %s 
;| FileCheck --check-prefixes=CHECK,GAUDI %s  
;| FileCheck --check-prefixes=CHECK,GOYA %s   