cargo build --release && cp target/release/bounds_checking_experiment main_rs_noboundschecks
cargo build --release --features bounds_checks && cp target/release/bounds_checking_experiment main_rs_withboundschecks

# Do one whole run as a super-warmup
hyperfine "./main_rs_noboundschecks 1337 1000 4000 false" "./main_rs_withboundschecks 1337 1000 4000 false" --warmup 30 --runs 500 --export-csv summary.csv
# Pay more attention to this one
hyperfine "./main_rs_noboundschecks 1337 1000 4000 false" "./main_rs_withboundschecks 1337 1000 4000 false" --warmup 30 --runs 500 --export-csv summary.csv
