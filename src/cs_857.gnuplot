# Raphael Reitzig, 2012.
# MIT license

set terminal pngcairo linewidth 2 size 450,300;
set key left top;

set output "cs_857_1.png";
set xrange [0:12000];
plot 5*x ti "f", 0.5*x*log(x) ti "g";


set xrange [0:2000];

set yrange [0:25000];
set output "cs_857_2.png";
plot .75*x*log(x) + .001*x*x*sin(5*cos(x)) ti "f",x*log(x) + 3*x*sin(5*cos(x)) ti "g";

set yrange [0:10000];
set output "cs_857_3.png";
plot 0.0025*x*x + 0.005*x*log(x) ti "f", 0.0000001*x*x*x + 5*x ti "g";

set yrange [0:500];
set output "cs_857_peter.png";
plot sqrt(x)*log(x) ti "f", 4*x**.6 ti "g";

