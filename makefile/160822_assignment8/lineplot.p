set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

set logscale x
set xlabel "Number of items"
set ylabel "Average time (microseconds)"
set xrange[10:10000000]
set ytic auto
set xtic auto

set key bottom right

set output "line.eps"
set title "Line graph for all threads"
plot 'analyse' every ::0::3 using 1:2 title "Thread 1" with linespoints lc 8, \
     '' every ::4::7 using 1:2 title "Thread 2" with linespoints pt 5 lc 7,\
     '' every ::8::11 using 1:2 title "Thread 4" with linespoints pt 5 lc 6,\
     '' every ::12::15 using 1:2 title "Thread 8" with linespoints pt 5 lc 5,\
     '' every ::16::19 using 1:2 title "Thread 16" with linespoints lc 3
