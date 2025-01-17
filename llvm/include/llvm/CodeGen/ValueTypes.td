//===- ValueTypes.td - ValueType definitions ---------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Value types - These values correspond to the register types defined in the
// MachineValueTypes.h file.  If you update anything here, you must update it
// there as well!
//
//===----------------------------------------------------------------------===//

class ValueType<int size, int value> {
  string Namespace = "MVT";
  int Size = size;
  int Value = value;
}

def OtherVT: ValueType<0  ,  1>;   // "Other" value
def i1     : ValueType<1  ,  2>;   // One bit boolean value
def i8     : ValueType<8  ,  3>;   // 8-bit integer value
def i16    : ValueType<16 ,  4>;   // 16-bit integer value
def i32    : ValueType<32 ,  5>;   // 32-bit integer value
def i64    : ValueType<64 ,  6>;   // 64-bit integer value
def i128   : ValueType<128,  7>;   // 128-bit integer value

def f8_143 : ValueType<16 ,  8>;   // 8-bit floating point value with 3-bit mantissa
def f8_152 : ValueType<16 ,  9>;   // 8-bit floating point value with 2-bit mantissa
def bf16   : ValueType<16 , 10>;   // 16-bit brain floating point value
def f16    : ValueType<16 , 11>;   // 16-bit floating point value
def f32    : ValueType<32 , 12>;   // 32-bit floating point value
def f64    : ValueType<64 , 13>;   // 64-bit floating point value
def f80    : ValueType<80 , 14>;   // 80-bit floating point value
def f128   : ValueType<128, 15>;   // 128-bit floating point value
def ppcf128: ValueType<128, 16>;   // PPC 128-bit floating point value

def v1i1   : ValueType<1 ,  17>;   //   1 x i1 vector value
def v2i1   : ValueType<2 ,  18>;   //   2 x i1 vector value
def v4i1   : ValueType<4 ,  19>;   //   4 x i1 vector value
def v8i1   : ValueType<8 ,  20>;   //   8 x i1 vector value
def v16i1  : ValueType<16,  21>;   //  16 x i1 vector value
def v32i1  : ValueType<32 , 22>;   //  32 x i1 vector value
def v64i1  : ValueType<64 , 23>;   //  64 x i1 vector value
def v128i1 : ValueType<128, 24>;   // 128 x i1 vector value
def v256i1 : ValueType<256, 25>;   // 256 x i1 vector value
def v512i1 : ValueType<512, 26>;   // 512 x i1 vector value
def v1024i1: ValueType<1024,27>;   //1024 x i1 vector value

def v1i8   : ValueType<8,   28>;   //  1 x i8  vector value
def v2i8   : ValueType<16 , 29>;   //  2 x i8  vector value
def v4i8   : ValueType<32 , 30>;   //  4 x i8  vector value
def v8i8   : ValueType<64 , 31>;   //  8 x i8  vector value
def v16i8  : ValueType<128, 32>;   // 16 x i8  vector value
def v32i8  : ValueType<256, 33>;   // 32 x i8  vector value
def v64i8  : ValueType<512, 34>;   // 64 x i8  vector value
def v128i8 : ValueType<1024,35>;   //128 x i8  vector value
def v256i8 : ValueType<2048,36>;   //256 x i8  vector value
def v512i8 : ValueType<4096,37>;   //512 x i8  vector value
def v1024i8: ValueType<8192,38>;   //1024 x i8 vector value

def v1i16  : ValueType<16 , 39>;   //  1 x i16 vector value
def v2i16  : ValueType<32 , 40>;   //  2 x i16 vector value
def v3i16  : ValueType<48 , 41>;   //  3 x i16 vector value
def v4i16  : ValueType<64 , 42>;   //  4 x i16 vector value
def v8i16  : ValueType<128, 43>;   //  8 x i16 vector value
def v16i16 : ValueType<256, 44>;   // 16 x i16 vector value
def v32i16 : ValueType<512, 45>;   // 32 x i16 vector value
def v64i16 : ValueType<1024,46>;   // 64 x i16 vector value
def v128i16: ValueType<2048,47>;   //128 x i16 vector value
def v256i16: ValueType<4096,48>;   //256 x i16 vector value
def v512i16: ValueType<8192,49>;   //512 x i16 vector value

def v1i32    : ValueType<32 , 50>;   //  1 x i32 vector value
def v2i32    : ValueType<64 , 51>;   //  2 x i32 vector value
def v3i32    : ValueType<96 , 52>;   //  3 x i32 vector value
def v4i32    : ValueType<128, 53>;   //  4 x i32 vector value
def v5i32    : ValueType<160, 54>;   //  5 x i32 vector value
def v8i32    : ValueType<256, 55>;   //  8 x i32 vector value
def v16i32   : ValueType<512, 56>;   // 16 x i32 vector value
def v32i32   : ValueType<1024,57>;   // 32 x i32 vector value
def v64i32   : ValueType<2048,58>;   // 64 x i32 vector value
def v128i32  : ValueType<4096,59>;   // 128 x i32 vector value
def v256i32  : ValueType<8182,60>;   // 256 x i32 vector value
def v512i32  : ValueType<16384,61>;  // 512 x i32 vector value
def v1024i32 : ValueType<32768,62>;  // 1024 x i32 vector value
def v2048i32 : ValueType<65536,63>;  // 2048 x i32 vector value

def v1i64  : ValueType<64 , 64>;   //  1 x i64 vector value
def v2i64  : ValueType<128, 65>;   //  2 x i64 vector value
def v4i64  : ValueType<256, 66>;   //  4 x i64 vector value
def v8i64  : ValueType<512, 67>;   //  8 x i64 vector value
def v16i64 : ValueType<1024,68>;   // 16 x i64 vector value
def v32i64 : ValueType<2048,69>;   // 32 x i64 vector value
def v64i64 : ValueType<4096,70>;   // 64 x i64 vector value
def v128i64: ValueType<8192,71>;   // 128 x i64 vector value
def v256i64: ValueType<16384,72>;  // 256 x i64 vector value

def v1i128 : ValueType<128, 73>;   //  1 x i128 vector value

def v256f8_143  : ValueType<2048, 74>;
def v512f8_143  : ValueType<4096, 75>;
def v1024f8_143 : ValueType<8192, 76>;

def v256f8_152  : ValueType<2048, 77>;
def v512f8_152  : ValueType<4096, 78>;
def v1024f8_152 : ValueType<8192, 79>;

def v2f16    : ValueType<32 , 80>;    //    2 x f16 vector value
def v3f16    : ValueType<48 , 81>;    //    3 x f16 vector value
def v4f16    : ValueType<64 , 82>;    //    4 x f16 vector value
def v8f16    : ValueType<128, 83>;    //    8 x f16 vector value
def v16f16   : ValueType<256, 84>;    //   16 x f16 vector value
def v32f16   : ValueType<512, 85>;    //   32 x f16 vector value
def v64f16   : ValueType<1024, 86>;   //   64 x f16 vector value
def v128f16  : ValueType<2048, 87>;   //  128 x f16 vector value
def v256f16  : ValueType<4096, 88>;   //  256 x f16 vector value

def v2bf16   : ValueType<32 , 89>;    //    2 x bf16 vector value
def v3bf16   : ValueType<48 , 90>;    //    3 x bf16 vector value
def v4bf16   : ValueType<64 , 91>;    //    4 x bf16 vector value
def v8bf16   : ValueType<128, 92>;    //    8 x bf16 vector value
def v16bf16  : ValueType<256, 93>;    //   16 x bf16 vector value
def v32bf16  : ValueType<512, 94>;    //   32 x bf16 vector value
def v64bf16  : ValueType<1024, 95>;   //   64 x bf16 vector value
def v128bf16 : ValueType<2048, 96>;   //  128 x bf16 vector value
def v256bf16 : ValueType<4096, 97>;   //  256 x bf16 vector value

def v1f32    : ValueType<32 , 98>;    //    1 x f32 vector value
def v2f32    : ValueType<64 , 99>;    //    2 x f32 vector value
def v3f32    : ValueType<96 , 100>;   //    3 x f32 vector value
def v4f32    : ValueType<128, 101>;   //    4 x f32 vector value
def v5f32    : ValueType<160, 102>;   //    5 x f32 vector value
def v8f32    : ValueType<256, 103>;   //    8 x f32 vector value
def v16f32   : ValueType<512, 104>;   //   16 x f32 vector value
def v32f32   : ValueType<1024, 105>;  //   32 x f32 vector value
def v64f32   : ValueType<2048, 106>;  //   64 x f32 vector value
def v128f32  : ValueType<4096, 107>;  //  128 x f32 vector value
def v256f32  : ValueType<8182, 108>;  //  256 x f32 vector value
def v512f32  : ValueType<16384, 109>; //  512 x f32 vector value
def v1024f32 : ValueType<32768, 110>; // 1024 x f32 vector value
def v2048f32 : ValueType<65536, 111>; // 2048 x f32 vector value

def v1f64    : ValueType<64, 112>;    //    1 x f64 vector value
def v2f64    : ValueType<128, 113>;   //    2 x f64 vector value
def v4f64    : ValueType<256, 114>;   //    4 x f64 vector value
def v8f64    : ValueType<512, 115>;   //    8 x f64 vector value
def v16f64   : ValueType<1024, 116>;  //   16 x f64 vector value
def v32f64   : ValueType<2048, 117>;  //   32 x f64 vector value
def v64f64   : ValueType<4096, 118>;  //   64 x f64 vector value
def v128f64  : ValueType<8192, 119>;  //  128 x f64 vector value
def v256f64  : ValueType<16384, 120>; //  256 x f64 vector value

def nxv1i1  : ValueType<1,  121>;  // n x  1 x i1  vector value
def nxv2i1  : ValueType<2,  122>;  // n x  2 x i1  vector value
def nxv4i1  : ValueType<4,  123>;  // n x  4 x i1  vector value
def nxv8i1  : ValueType<8,  124>;  // n x  8 x i1  vector value
def nxv16i1 : ValueType<16, 125>;  // n x 16 x i1  vector value
def nxv32i1 : ValueType<32, 126>;  // n x 32 x i1  vector value
def nxv64i1  : ValueType<64,127>;  // n x  64 x i1  vector value

def nxv1i8  : ValueType<8,   128>;  // n x  1 x i8  vector value
def nxv2i8  : ValueType<16,  129>;  // n x  2 x i8  vector value
def nxv4i8  : ValueType<32,  130>;  // n x  4 x i8  vector value
def nxv8i8  : ValueType<64,  131>;  // n x  8 x i8  vector value
def nxv16i8 : ValueType<128, 132>;  // n x 16 x i8  vector value
def nxv32i8 : ValueType<256, 133>;  // n x 32 x i8  vector value
def nxv64i8 : ValueType<512, 134>;  // n x  64 x i8  vector value

def nxv1i16 : ValueType<16,  135>; // n x  1 x i16 vector value
def nxv2i16 : ValueType<32,  136>; // n x  2 x i16 vector value
def nxv4i16 : ValueType<64,  137>; // n x  4 x i16 vector value
def nxv8i16 : ValueType<128, 138>; // n x  8 x i16 vector value
def nxv16i16: ValueType<256, 139>; // n x 16 x i16 vector value
def nxv32i16: ValueType<512, 140>; // n x 32 x i16 vector value

def nxv1i32 : ValueType<32,  141>; // n x  1 x i32 vector value
def nxv2i32 : ValueType<64,  142>; // n x  2 x i32 vector value
def nxv4i32 : ValueType<128, 143>; // n x  4 x i32 vector value
def nxv8i32 : ValueType<256, 144>; // n x  8 x i32 vector value
def nxv16i32: ValueType<512, 145>; // n x 16 x i32 vector value
def nxv32i32: ValueType<1024,146>; // n x 32 x i32 vector value

def nxv1i64 : ValueType<64,  147>; // n x  1 x i64 vector value
def nxv2i64 : ValueType<128, 148>; // n x  2 x i64 vector value
def nxv4i64 : ValueType<256, 149>; // n x  4 x i64 vector value
def nxv8i64 : ValueType<512, 150>; // n x  8 x i64 vector value
def nxv16i64: ValueType<1024,151>; // n x 16 x i64 vector value
def nxv32i64: ValueType<2048,152>; // n x 32 x i64 vector value

def nxv1f16   : ValueType<32, 153>; // n x   1 x f16 vector value
def nxv2f16  : ValueType<32 , 154>; // n x  2 x f16 vector value
def nxv4f16  : ValueType<64 , 155>; // n x  4 x f16 vector value
def nxv8f16  : ValueType<128, 156>; // n x  8 x f16 vector value
def nxv16f16  : ValueType<256,157>; // n x  16 x f16 vector value
def nxv32f16  : ValueType<512,158>; // n x  32 x f16 vector value
def nxv2bf16 : ValueType<32 , 159>; // n x  2 x bf16 vector value
def nxv4bf16 : ValueType<64 , 160>; // n x  4 x bf16 vector value
def nxv8bf16 : ValueType<128, 161>; // n x  8 x bf16 vector value
def nxv1f32  : ValueType<32 , 162>; // n x  1 x f32 vector value
def nxv2f32  : ValueType<64 , 163>; // n x  2 x f32 vector value
def nxv4f32  : ValueType<128, 164>; // n x  4 x f32 vector value
def nxv8f32  : ValueType<256, 165>; // n x  8 x f32 vector value
def nxv16f32 : ValueType<512, 166>; // n x 16 x f32 vector value
def nxv1f64  : ValueType<64,  167>; // n x  1 x f64 vector value
def nxv2f64  : ValueType<128, 168>; // n x  2 x f64 vector value
def nxv4f64  : ValueType<256, 169>; // n x  4 x f64 vector value
def nxv8f64  : ValueType<512, 170>; // n x  8 x f64 vector value

def x86mmx : ValueType<64 , 171>;   // X86 MMX value
def FlagVT : ValueType<0  , 172>;   // Pre-RA sched glue
def isVoid : ValueType<0  , 173>;   // Produces no value
def untyped: ValueType<8  , 174>;   // Produces an untyped value
def funcref : ValueType<0  , 175>;   // WebAssembly's funcref type
def externref : ValueType<0 , 176>;   // WebAssembly's externref type
def x86amx : ValueType<8192, 177>;   // X86 AMX value

def token  : ValueType<0  , 248>;   // TokenTy
def MetadataVT: ValueType<0, 249>;  // Metadata

// Pseudo valuetype mapped to the current pointer size to any address space.
// Should only be used in TableGen.
def iPTRAny   : ValueType<0, 250>;

// Pseudo valuetype to represent "vector of any size"
def vAny   : ValueType<0  , 251>;

// Pseudo valuetype to represent "float of any format"
def fAny   : ValueType<0  , 252>;

// Pseudo valuetype to represent "integer of any bit width"
def iAny   : ValueType<0  , 253>;

// Pseudo valuetype mapped to the current pointer size.
def iPTR   : ValueType<0  , 254>;

// Pseudo valuetype to represent "any type of any size".
def Any    : ValueType<0  , 255>;

/// This class is for targets that want to use pointer types in patterns
/// with the GlobalISelEmitter.  Targets must define their own pointer
/// derived from this class.  The scalar argument should be an
/// integer type with the same bit size as the ponter.
/// e.g. def p0 : PtrValueType <i64, 0>;

class PtrValueType <ValueType scalar, int addrspace> :
    ValueType<scalar.Size, scalar.Value> {
  int AddrSpace = addrspace;
}
