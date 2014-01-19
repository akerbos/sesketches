# Raphael Reitzig, 2012.
# MIT license

set terminal pngcairo linewidth 2;
set key left top;

set output "cs_3_1.png";
set yrange [0:52000];
set xrange [0:150];
plot 11.667*(x+1)*log(x) - 1.74*x - 18.74 ti "Quicksort", \
     12.5*x*log(x)                        ti "Mergesort", \
     16*x*log(x) + 0.01*x                 ti "Heapsort", \
     2.25*x*x + 7.75*x - 3*log(x)         ti "Insertion Sort";
     
set output "cs_3_2.png";
set yrange [0:1000];
set xrange [0:20];
plot 11.667*(x+1)*log(x) - 1.74*x - 18.74 ti "Quicksort", \
     12.5*x*log(x)                        ti "Mergesort", \
     16*x*log(x) + 0.01*x                 ti "Heapsort", \
     2.25*x*x + 7.75*x - 3*log(x)         ti "Insertion Sort";
