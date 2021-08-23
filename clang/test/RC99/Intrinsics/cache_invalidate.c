// RUN: %codegen -S -O1 -triple tpc-none-none -std=rc99 %s -o - | FileCheck %s
// RUN: %codegen -S -O1 -triple tpc-none-none -std=rc99 -bfloat16 -target-cpu gaudi %s -o - | FileCheck %s



void main(_Bool x) {
  cache_invalidate_b(0, 1, 0);
// CHECK: cache_invalidate

  cache_invalidate_b(0, x, 0);
// CHECK: cache_invalidate %SP{{[0-9]+}}
}
