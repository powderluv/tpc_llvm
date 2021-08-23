// RUN: %clang -cc1as -triple tpc-none-none -filetype obj %s -o %t.o
// RUN: %disasm %t.o | FileCheck %s
// RUN: %clang -cc1as -triple tpc-none-none -target-cpu gaudi -filetype obj %s -o %t.o
// RUN: %disasm -mcpu=gaudi %t.o | FileCheck %s




nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000;         nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !VP1; nop


//--- Variants where Dx is represented as Vx.


nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.i32 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.i32 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.i16 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.i16 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.i8 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.i8 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.u32 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.u32 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.u16 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.u16 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, 122, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, 0x7a, V7, V8, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123;         nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, SP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, !SP1;   nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, VP1;    nop
nop; nop; sel2_geq.u8 D4, V5, V6, V7, 123, !VP1;   nop

// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, SP0; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, !SP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, VP1; nop
// CHECK: nop; nop; sel2_geq.u8 D4, V5, V6, V7, 0x7b, !VP1; nop



nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, V8, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, S3, V7, V8, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, 0x3f800000, V7, V8, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP0;         nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, S3, !VP1; nop

nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000;         nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, SP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !SP1;   nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, VP1;    nop
nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !VP1;   nop

// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, SP0; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !SP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, VP1; nop
// CHECK: nop; nop; sel2_geq.f32 D4, V5, V6, V7, 0x3f800000, !VP1; nop