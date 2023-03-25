// Differences from C version:
// - Uses Vecs instead of raw arrays
// - Gets sizes from those vecs instead of from parameters
// (Also why we dont directly benchmark C vs Rust, just the approaches)

use std::env;
use std::cmp::min;
use std::cmp::max;

struct RandResult {
  new_seed: i64,
  rand_int: i64,
}

fn next_rand(mut x: i64) -> RandResult{
  x = x + (x / 200096);
  x = x - (x * 33554432);
  x = x + (x / 134217728);
  return RandResult{new_seed: x, rand_int: x * 2685821657736338717 / 4294967296};
}

fn make_board(mut rand_seed: i64, num_rows: usize, num_cols: usize) -> Vec<Vec<bool>> {
  let mut new_rows = Vec::with_capacity(num_rows);
  for _ in 0..num_rows {
    let mut new_row = Vec::with_capacity(num_cols);
    for _ in 0..num_cols {
      let RandResult { rand_int, new_seed } = next_rand(rand_seed);
      rand_seed = new_seed;
      let rand_bool = (rand_int % 2) == 0;
      new_row.push(rand_bool);
    }
    new_rows.push(new_row);
  }
  return new_rows;
}

#[cfg(not(feature = "bounds_checks"))]
fn lookup(map: &Vec<Vec<bool>>, row_i: usize, col_i: usize) -> bool {
    unsafe {
        return *map.get_unchecked(row_i).get_unchecked(col_i);
    }
}

#[cfg(feature = "bounds_checks")]
fn lookup(map: &Vec<Vec<bool>>, row_i: usize, col_i: usize) -> bool {
    return map[row_i][col_i];
}

fn cellular_automata(old_rows: &Vec<Vec<bool>>, num_rows: usize, num_cols: usize) -> Vec<Vec<bool>> {
  let mut new_rows = Vec::with_capacity(num_rows);
  for row_i in 0..num_rows {
    let mut new_row = Vec::with_capacity(num_cols);
    for col_i in 0..num_cols {

      let mut num_adj_walkable = 0;

      for adj_row_i in max(0, row_i - 1)..=min(num_rows - 1, row_i + 1) {
        for adj_col_i in max(0, col_i - 1)..=min(num_cols - 1, col_i + 1) {
          if row_i != adj_row_i || col_i != adj_col_i {
            if lookup(old_rows, adj_row_i, adj_col_i) {
              num_adj_walkable = num_adj_walkable + 1;
            }
          }
        }
      }
      let new_walkable =
          if num_adj_walkable < 4 { false }
          else if num_adj_walkable > 4 { true }
          else { lookup(old_rows, row_i, col_i) };
      new_row.push(new_walkable);
    }
    new_rows.push(new_row);
  }
  return new_rows;
}

fn display(map: &Vec<Vec<bool>>, num_rows: usize, num_cols: usize) {
  for row_i in 0..num_rows {
    for col_i in 0..num_cols {
      if lookup(map, row_i, col_i) {
        print!("#");
      } else {
        print!(".");
      }
    }
    println!();
  }
}

fn main() -> () {
  let args: Vec<String> = env::args().collect();
  if args.len() < 4 {
    eprintln!("Usage: {} [seed:int] [num_rows:int] [num_cols:int] [display:bool]", args[0]);
    eprintln!("Example: {} 1337 20 80 true", args[0]);
    panic!();
  }

  let random_seed = args[1].parse::<i64>().expect("Bad random_seed");
  let num_rows = args[2].parse::<usize>().expect("Bad num_rows");
  let num_cols = args[3].parse::<usize>().expect("Bad num_cols");

  let mut board_0 = make_board(random_seed, num_rows, num_cols);

  let mut board_1 = cellular_automata(&mut board_0, num_rows, num_cols);

  let board_2 = cellular_automata(&mut board_1, num_rows, num_cols);

  if args[4] == "true" {
    display(&board_2, num_rows, num_cols);
  }
}
