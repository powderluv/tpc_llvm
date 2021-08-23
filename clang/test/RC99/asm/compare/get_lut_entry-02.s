// RUN: %clang -cc1as -triple tpc-none-none  -filetype obj %s -o %t.o
// RUN: %disasm %t.o | FileCheck %s

NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 1, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 1, 1, SP3; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 1, 1, !SP3; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 1, 1, VP3; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 1, 1, !VP3; NOP

// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x1, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x1, SP3;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x1, !SP3;   nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x1, VP3;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x1, !VP3;   nop


NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 0, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 1, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 2, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 3, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 12, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 13, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 14, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 15, 1; NOP

// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x0, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x1, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x2, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x3, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0xc, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0xd, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0xe, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0xf, SP0;    nop


NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, 0; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, 1; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, 2; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, 3; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, 4; NOP

// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  D4, V2, 0x4, SP0;        nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x4, SP0;    nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  sqrt_rsqrt D4, V2, 0x4, SP0;      nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  sin_cos D4, V2, 0x4, SP0;         nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  log D4, V2, 0x4, SP0;         nop


NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, tanh; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, sqrt_rsqrt; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, sin_cos; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, log; NOP

// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  D4, V2, 0x4, SP0;         nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x4, SP0;     nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  sqrt_rsqrt D4, V2, 0x4, SP0;       nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  sin_cos D4, V2, 0x4, SP0;  nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  log D4, V2, 0x4, SP0;      nop


NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, tanh; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, sqrt_rsqrt; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, sin_cos; NOP
NOP; NOP; GET_LUT_ENTRY_AND_INTERVAL_START.BF16 V4, V2, 4, log; NOP

// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  D4, V2, 0x4, SP0;         nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  tanh D4, V2, 0x4, SP0;     nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  sqrt_rsqrt D4, V2, 0x4, SP0;       nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  sin_cos D4, V2, 0x4, SP0;  nop
// CHECK: nop;    nop;    get_lut_entry_and_interval_start.bf16  log D4, V2, 0x4, SP0;      nop