// Sample mystery program to measure how long an add takes. Flawed.
// Copyright 2021 Richard L. Sites

#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int manual_unroll = 8;
static const int kIterations = 1000 * 1000000;

int main (int argc, const char** argv) {
  register uint64_t sum_0 = 0;
  register uint64_t sum_1 = 0;
  register uint64_t sum_2 = 0;
  register uint64_t sum_3 = 0;

  time_t t = time(NULL);	// A number that the compiler does not know
  register uint64_t incr = t & 0x3;		// Unknown increment 0..3

  int64_t startcy = GetCycles();
  // Qi YuHang: Ice Lake has Sunny Cove Microarchitecture, scheduler with 8-way issue port for uop, 4 int ALU in EU(Execute Unit)
  for (register int i = 0; i < kIterations; i++) {
    sum_0 *= incr;
    sum_1 *= incr;
    sum_2 *= incr;
    sum_3 *= incr;

    sum_0 *= incr;
    sum_1 *= incr;
    sum_2 *= incr;
    sum_3 *= incr;
  }
  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration, %4.2f cycles/inst\n", 
          kIterations, elapsed, felapsed / kIterations, felapsed / kIterations / static_cast<double>(manual_unroll) * static_cast<double>(4.0));
  
  fprintf(stderr, "%lu %lu %lu %lu %lu\n", t, sum_0, sum_1, sum_2, sum_3);	// Make sum live
  return 0;
}
