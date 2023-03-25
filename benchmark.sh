clang -std=c2x -O2 -Wall -Werror main.c -DBOUNDS_CHECKS=0 -o main_noboundschecks
clang -std=c2x -O2 -Wall -Werror main.c -DBOUNDS_CHECKS=1 -o main_withboundschecks
clang -std=c2x -O2 -Wall -Werror main.c -DBOUNDS_CHECKS=2 -o main_weirdboundschecks
# Do one whole run as a super-warmup
hyperfine "./main_noboundschecks 1337 1000 4000 false" "./main_withboundschecks 1337 1000 4000 false" "./main_weirdboundschecks 1337 1000 4000 false" --warmup 30 --runs 500 --export-csv summary.csv
# Pay more attention to this one
hyperfine "./main_noboundschecks 1337 1000 4000 false" "./main_withboundschecks 1337 1000 4000 false" "./main_weirdboundschecks 1337 1000 4000 false" --warmup 30 --runs 500 --export-csv summary.csv
