#set terminal postscript eps enhanced color size 3.9,2.9
set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "speedup.eps"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"
set xlabel "Inputs"
set ylabel "Speedup"
set yrange[0:5]
set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border
set terminal postscript eps enhanced color size 3.9,2.9
set output "speedup_color.eps"
set title "Bar graph"
              plot 'log2.txt' u 2:xticlabels(1) title "Thread 1",\
               '' u 3 title "Thread 2" fillstyle pattern 7,\
                '' u 4 title "Thread 4" fillstyle pattern 12,\
                 '' u 5 title "Thread 8" fillstyle pattern 14,\
                  '' u 6 title "Thread 16" fillstyle pattern 16

set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "speedup_errorbar.eps"
set xtics rotate by -45
set style histogram errorbars lw 3
set style data histogram

set title "Bar graph with error bars"
plot 'log2.txt' u 2:7:xticlabels(1) title "Thread 1",\
'' u 3:8 title "Thread 2" fillstyle pattern 7,\
'' u 4:9 title "Thread 4" fillstyle pattern 12,\
'' u 5:10 title "Thread 8" fillstyle pattern 14,\
'' u 6:11 title "Thread 16" fillstyle pattern 16
