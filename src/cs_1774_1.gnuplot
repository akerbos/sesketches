# Raphael Reitzig, 2012.
# MIT license

set terminal pngcairo linewidth 2 size 450,300;
set key left top;

set output "cs_1774.png";
set xrange [0:100];
plot 10*exp(-0.5*((x-50)/0.5)**2) / sqrt(2*pi*0.5**2);

