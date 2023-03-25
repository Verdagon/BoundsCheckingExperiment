#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>

#ifndef BOUNDS_CHECKS
#error "Error: Pass in -DBOUNDS_CHECKS=0 or -DBOUNDS_CHECKS=1 when compiling."
#endif

// Uses compiler specific extensions if possible.
#ifdef __GNUC__ // GCC, Clang, ICC
 
#define unreachable() (__builtin_unreachable())
 
#elifdef _MSC_VER // MSVC
 
#define unreachable() (__assume(false))
 
#else
// Even if no extension is used, undefined behavior is still raised by
// the empty function body and the noreturn attribute.
 
// The external definition of unreachable_impl must be emitted in a separated TU
// due to the rule for inline functions in C.
 
[[noreturn]] inline void unreachable_impl() {}
#define unreachable() (unreachable_impl())
 
#endif

typedef struct RandResult {
  int64_t newSeed;
  int64_t randInt;
} RandResult;

RandResult NextRand(int64_t x) {
  x = x + (x / 200096L);
  x = x - (x * 33554432L);
  x = x + (x / 134217728L);
  RandResult result = {x, x * 2685821657736338717L / 4294967296L};
  return result;
}

int32_t min(int32_t a, int32_t b) {
  return a <= b ? a : b;
}

int32_t max(int32_t a, int32_t b) {
  return a >= b ? a : b;
}

char** makeBoard(int64_t randSeed, uint64_t numRows, uint64_t numCols) {
  char** rows = (char**)malloc(sizeof(char*) * numRows);
  for (uint64_t row_i = 0; row_i < numRows; row_i++) {
    char* row = (char*)malloc(sizeof(char) * numCols);
    for (uint64_t col_i = 0; col_i < numCols; col_i++) {
      RandResult randResult = NextRand(randSeed);
      randSeed = randResult.newSeed;
      int64_t randInt = randResult.randInt;
      char randBool = (randInt % 2) == 0;
      row[col_i] = randBool;
    }
    rows[row_i] = row;
  }
  return rows;
}

char lookup(char** map, uint64_t numRows, uint64_t numCols, uint64_t row_i, uint64_t col_i) {
#if BOUNDS_CHECKS == 0
  char* row = map[row_i];
  return row[col_i];
#elif BOUNDS_CHECKS == 1
  // Bounds check
  if (row_i >= numRows) {
    fprintf(stderr, "Index out of bounds!");
    exit(1);
  }
  char* row = map[row_i];
  // Bounds check
  if (col_i >= numCols) {
    fprintf(stderr, "Index out of bounds!");
    exit(1);
  }
  return row[col_i];
#elif BOUNDS_CHECKS == 2
  if (row_i >= numRows) {
    unreachable();
  }
  char* row = map[row_i];
  if (col_i >= numCols) {
    unreachable();
  }
  return row[col_i];
#else
#error "Bad value for BOUNDS_CHECKS"
#endif
}

char** cellularAutomata(char** old_rows, uint64_t numRows, uint64_t numCols) {
  char** new_rows = (char**)malloc(sizeof(char*) * numRows);
  for (uint64_t row_i = 0; row_i < numRows; row_i++) {
    char* new_row = (char*)malloc(sizeof(char) * numCols);
    for (uint64_t col_i = 0; col_i < numCols; col_i++) {
      uint64_t num_adj_walkable = 0;

      for (int adj_row_i = max(0, row_i - 1); adj_row_i <= min(numRows - 1, row_i + 1); adj_row_i++) {
        for (int adj_col_i = max(0, col_i - 1); adj_col_i <= min(numCols - 1, col_i + 1); adj_col_i++) {
          if (row_i != adj_row_i || col_i != adj_col_i) {
            if (lookup(old_rows, numRows, numCols, adj_row_i, adj_col_i)) {
              num_adj_walkable++;
            }
          }
        }
      }
      char new_walkable;
      if (num_adj_walkable < 4) {
        new_walkable = 0;
      } else if (num_adj_walkable > 4) {
        new_walkable = 1;
      } else {
        new_walkable = old_rows[row_i][col_i];
      }
      new_row[col_i] = new_walkable;
    }
    new_rows[row_i] = new_row;
  }
  return new_rows;
}

void display(char** map, uint64_t numRows, uint64_t numCols) {
  for (uint64_t row_i = 0; row_i < numRows; row_i++) {
    for (uint64_t col_i = 0; col_i < numCols; col_i++) {
      if (lookup(map, numRows, numCols, row_i, col_i)) {
        printf("#");
      } else {
        printf(".");
      }
    }
    printf("\n");
  }
}

int main(int argc, char** argv) {
  if (argc < 4) {
    fprintf(stderr, "Usage: %s [seed:int] [numRows:int] [numCols:int] [display:bool]\n", argv[0]);
    fprintf(stderr, "Example: %s 1337 20 80 true\n", argv[0]);
    exit(1);
  }

  int64_t randomSeed = atoi(argv[1]);
  uint64_t numRows = atoi(argv[2]);
  uint64_t numCols = atoi(argv[3]);

  char** board0 = makeBoard(randomSeed, numRows, numCols);

  char** board1 = cellularAutomata(board0, numRows, numCols);

  for (uint64_t row_i = 0; row_i < numRows; row_i++) {
    free(board0[row_i]);
  }
  free(board0);

  char** board2 = cellularAutomata(board1, numRows, numCols);

  for (uint64_t row_i = 0; row_i < numRows; row_i++) {
    free(board1[row_i]);
  }
  free(board1);

  if (strncmp(argv[4], "true", strlen("true")) == 0) {
    display(board2, numRows, numCols);
  }

  for (uint64_t row_i = 0; row_i < numRows; row_i++) {
    free(board2[row_i]);
  }
  free(board2);

  return 0;
}
