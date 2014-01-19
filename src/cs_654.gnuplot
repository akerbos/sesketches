# Raphael Reitzig, 2012.
# MIT license

set terminal pngcairo linewidth 2;

set output "cs_654_1.png";
set yrange [0:14];
set xrange [0:100000];
plot log(x), log(log(x));

set output "cs_654_2.png";
set yrange [0:1500000];
set xrange [0:100000];
plot x*log(x), x*log(log(x));
