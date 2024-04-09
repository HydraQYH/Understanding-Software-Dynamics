// Sample mystery program to measure how long an add takes. Flawed.
// Copyright 2021 Richard L. Sites

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int manual_unroll = 8;
static const int kIterations = 10000;

int main (int argc, const char** argv) {
  time_t t0 = time(NULL);	// A number that the compiler does not know
  register float sum_0 = static_cast<float>(rand()) / static_cast<float>(RAND_MAX);
  time_t t1 = time(NULL);
  register float sum_1 = static_cast<float>(rand()) / static_cast<float>(RAND_MAX);
  time_t t = time(NULL);
  register float incr = static_cast<float>(rand()) / static_cast<float>(RAND_MAX) * static_cast<float>(0.001) + static_cast<float>(1.0);		// Unknown increment 0..3
  
  fprintf(stderr, "%4.2f %4.2f %4.2f\n", incr, sum_0, sum_1);	// Make sum live
  
  int64_t startcy = GetCycles();
  // Qi YuHang: Ice Lake has Sunny Cove Microarchitecture, scheduler with 8-way issue port for uop, 2 FP Unit
  for (register int i = 0; i < kIterations; i++) {
    sum_0 *= incr;
    sum_1 *= incr;

    sum_0 *= incr;
    sum_1 *= incr;
    
    sum_0 *= incr;
    sum_1 *= incr;

    sum_0 *= incr;
    sum_1 *= incr;
  }
  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration, %4.2f cycles/inst\n", 
          kIterations, elapsed, felapsed / kIterations, felapsed / kIterations / static_cast<double>(manual_unroll) * static_cast<double>(2.0));

  fprintf(stderr, "%4.2f %4.2f %4.2f\n", incr, sum_0, sum_1);	// Make sum live
  return 0;
}
