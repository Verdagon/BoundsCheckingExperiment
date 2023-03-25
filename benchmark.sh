clang -std=c2x -O2 -Wall -Werror main.c -DBOUNDS_CHECKS=0 -o main_noboundschecks_sanity
clang -std=c2x -O2 -Wall -Werror main.c -DBOUNDS_CHECKS=0 -o main_noboundschecks_O2
clang -std=c2x -O2 -Wall -Werror main.c -DBOUNDS_CHECKS=1 -o main_withboundschecks_O2
clang -std=c2x -O3 -Wall -Werror main.c -DBOUNDS_CHECKS=0 -o main_noboundschecks_O3
clang -std=c2x -O3 -Wall -Werror main.c -DBOUNDS_CHECKS=1 -o main_withboundschecks_O3

# Do a run as a super-warmup
hyperfine "./main_noboundschecks_sanity 1337 1000 4000 false" "./main_noboundschecks_O2 1337 1000 4000 false" "./main_withboundschecks_O2 1337 1000 4000 false" "./main_noboundschecks_O3 1337 1000 4000 false" "./main_withboundschecks_O3 1337 1000 4000 false" --warmup 30 --runs 500 --export-csv summary.csv
# Pay more attention to this one
hyperfine "./main_noboundschecks_sanity 1337 1000 4000 false" "./main_noboundschecks_O2 1337 1000 4000 false" "./main_withboundschecks_O2 1337 1000 4000 false" "./main_noboundschecks_O3 1337 1000 4000 false" "./main_withboundschecks_O3 1337 1000 4000 false" --warmup 30 --runs 500 --export-csv summary.csv

