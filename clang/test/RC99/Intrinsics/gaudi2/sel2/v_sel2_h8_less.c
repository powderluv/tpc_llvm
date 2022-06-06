
// RUN: %codegen -S -O1 -triple tpc-none-none -std=rc99  -target-cpu gaudi2 %s -o - | FileCheck --check-prefixes=CHECK %s
// RUN: %codegen -S -O1 -triple tpc-none-none -std=rc99  -target-cpu doron1 %s -o - | FileCheck --check-prefixes=CHECK %s



typedef struct _int64_pair_t  int64_int64;

typedef struct _minihalf256_char256_pair_t minihalf256_char256;
typedef struct _minihalf256_uchar256_pair_t minihalf256_uchar256;

typedef struct _minifloat256_char256_pair_t minifloat256_char256;
typedef struct _minifloat256_uchar256_pair_t minifloat256_uchar256;

typedef struct _char256_minihalf256_pair_t char256_minihalf256;
typedef struct _char256_minifloat256_pair_t  char256_minifloat256;

typedef struct _uchar256_minihalf256_pair_t uchar256_minihalf256;
typedef struct _uchar256_minifloat256_pair_t uchar256_minifloat256;

typedef struct _minihalf256_pair_t minihalf256_minihalf256;
typedef struct _minihalf256_minifloat256_pair_t minihalf256_minifloat256;
typedef struct _minifloat256_minihalf256_pair_t minifloat256_minihalf256;

void main(int dest, int src1, int src2, int pred_val, int vect_pred,
          float af32, int ai32, unsigned au32, short ai16, unsigned short au16,
          char ai8, unsigned char au8) {
  int64_int64 __local *dest_ptr = (int64_int64 __local *)dest;
  int64 __local *src_ptr = (int64 __local *)src1;          
  int64 __local *res_ptr = (int64 __local *)src2;
  bool256 __local *vpred_ptr = (bool256 __local *)vect_pred;
  minihalf af8 = (minihalf)ai8;
  minifloat ah8 = (minifloat)ai8;
  _Bool spred = src1 < src2;
  bool256 vpred = *vpred_ptr;
  // CHECK-DAG: cmp_less.i32 [[SPRED:%SP[0-9]+]], %S1, %S2
  // CHECK-DAG: ld_l_v [[VPRED:%VP[0-9]+]]


  if (dest > 13) {
    volatile minihalf256_minihalf256 __local *dptr = (minihalf256_minihalf256 __local *)dest_ptr;
    volatile minihalf256 __local *sptr = (minihalf256 __local *)src_ptr;
    volatile minihalf256 __local *rptr = (minihalf256 __local *)res_ptr;

    minihalf256_minihalf256 result = *dptr++;
    minihalf256 x1 = *sptr++;
    minihalf256 x2 = *sptr++;
    minihalf256 x3 = *rptr++;
    minihalf256 x4 = *rptr++;


    //------ v_h8_sel2_less_h8_b

    result = v_h8_sel2_less_h8_b(x1, x2, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]     

    result = v_h8_sel2_less_h8_b(x1, af8, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]    

    result = v_h8_sel2_less_h8_b(x1, (minihalf)1.5, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]   

    result = v_h8_sel2_less_h8_b(x1, x2, x3, af8, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[SPRED]]     

    result = v_h8_sel2_less_h8_b(x1, x2, x3, (minihalf)1.5, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[SPRED]]

    //------ v_h8_sel2_less_h8_vb

    result = v_h8_sel2_less_h8_vb(x1, x2, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_h8_vb(x1, af8, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]    

    result = v_h8_sel2_less_h8_vb(x1, (minihalf)1.5, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]   

    result = v_h8_sel2_less_h8_vb(x1, x2, x3, af8, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_h8_vb(x1, x2, x3, (minihalf)1.5, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_152  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[VPRED]]

    dest_ptr = (int64_int64 __local *)dptr;
    src_ptr = (int64 __local *)sptr;
    res_ptr = (int64 __local *)rptr;
  }
    if (dest > 14) {
    volatile minihalf256_minifloat256 __local *dptr = (minihalf256_minifloat256 __local *)dest_ptr;
    volatile minifloat256 __local *sptr = (minifloat256 __local *)src_ptr;
    volatile minihalf256 __local *rptr = (minihalf256 __local *)res_ptr;

    volatile minihalf256_minifloat256 result = *dptr++;
    minifloat256 x1 = *sptr++;
    minifloat256 x2 = *sptr++;
    minihalf256 x3 = *rptr++;
    minihalf256 x4 = *rptr++;


    //------ v_h8_sel2_less_f8_b

   result = v_h8_sel2_less_f8_b(x1, x2, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]     
    result = v_h8_sel2_less_f8_b(x1, ah8, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]    

    result = v_h8_sel2_less_f8_b(x1, (minifloat)1.5, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x3c, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]   

    result = v_h8_sel2_less_f8_b(x1, x2, x3, af8, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[SPRED]]     

    result = v_h8_sel2_less_f8_b(x1, x2, x3, (minihalf)1.5, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[SPRED]]

    //------ v_h8_sel2_less_f8_vb

    result = v_h8_sel2_less_f8_vb(x1, x2, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_f8_vb(x1, ah8, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]    

    result = v_h8_sel2_less_f8_vb(x1, (minifloat)1.5, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x3c, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]   

    result = v_h8_sel2_less_f8_vb(x1, x2, x3, af8, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_f8_vb(x1, x2, x3, (minihalf)1.5, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.f8_143  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[VPRED]]
    dest_ptr = (int64_int64 __local *)dptr;
    src_ptr = (int64 __local *)sptr;
    res_ptr = (int64 __local *)rptr;
    }
  if (dest > 15) {
    volatile minihalf256_char256 __local *dptr = (minihalf256_char256 __local *)dest_ptr;
    volatile char256 __local *sptr = (char256 __local *)src_ptr;
    volatile minihalf256 __local *rptr = (minihalf256 __local *)res_ptr;

    minihalf256_char256 result = *dptr++;
    char256 x1 = *sptr++;
    char256 x2 = *sptr++;
    minihalf256 x3 = *rptr++;
    minihalf256 x4 = *rptr++;


    //------ v_h8_sel2_less_i8_b

    result = v_h8_sel2_less_i8_b(x1, x2, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]     

    result = v_h8_sel2_less_i8_b(x1, ai16, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]    

    result = v_h8_sel2_less_i8_b(x1, 123, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x7b, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]   

    result = v_h8_sel2_less_i8_b(x1, x2, x3, af8, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[SPRED]]     

    result = v_h8_sel2_less_i8_b(x1, x2, x3, (minihalf)1.5, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[SPRED]]

    //------ v_h8_sel2_less_i8_vb

    result = v_h8_sel2_less_i8_vb(x1, x2, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_i8_vb(x1, ai16, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]    

    result = v_h8_sel2_less_i8_vb(x1, 123, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x7b, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]   

    result = v_h8_sel2_less_i8_vb(x1, x2, x3, af8, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_i8_vb(x1, x2, x3, (minihalf)1.5, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.i8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[VPRED]]

    dest_ptr = (int64_int64 __local *)dptr;
    src_ptr = (int64 __local *)sptr;
    res_ptr = (int64 __local *)rptr;
  }
    
  if (dest > 16) {
    volatile minihalf256_uchar256 __local *dptr = (minihalf256_uchar256 __local *)dest_ptr;
    volatile uchar256 __local *sptr = (uchar256 __local *)src_ptr;
    volatile minihalf256 __local *rptr = (minihalf256 __local *)res_ptr;

    minihalf256_uchar256 result = *dptr++;
    uchar256 x1 = *sptr++;
    uchar256 x2 = *sptr++;
    minihalf256 x3 = *rptr++;
    minihalf256 x4 = *rptr++;


    //------ v_h8_sel2_less_u8_b

    result = v_h8_sel2_less_u8_b(x1, x2, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]     

    result = v_h8_sel2_less_u8_b(x1, au16, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]    

    result = v_h8_sel2_less_u8_b(x1, 123, x3, x4, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x7b, %V{{[0-9]+}}, %V{{[0-9]+}}, [[SPRED]]   

    result = v_h8_sel2_less_u8_b(x1, x2, x3, af8, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[SPRED]]     

    result = v_h8_sel2_less_u8_b(x1, x2, x3, (minihalf)1.5, 0, result, spred, 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[SPRED]]

    //------ v_h8_sel2_less_u8_vb

    result = v_h8_sel2_less_u8_vb(x1, x2, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_u8_vb(x1, au16, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]    

    result = v_h8_sel2_less_u8_vb(x1, 123, x3, x4, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, 0x7b, %V{{[0-9]+}}, %V{{[0-9]+}}, [[VPRED]]   

    result = v_h8_sel2_less_u8_vb(x1, x2, x3, af8, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %S{{[0-9]+}}, [[VPRED]]     

    result = v_h8_sel2_less_u8_vb(x1, x2, x3, (minihalf)1.5, 0, result, (vpred), 0);
    *dptr++ = result;
    // CHECK: sel2_less.u8  %D{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, %V{{[0-9]+}}, 0x3e, [[VPRED]]

    dest_ptr = (int64_int64 __local *)dptr;
    src_ptr = (int64 __local *)sptr;
    res_ptr = (int64 __local *)rptr;
  }

}