App:thread.ex1    
thread.ex1:prog.o thread.o 
	gcc -I. -o thread.ex1 prog.o thread.o -lpthread -lm
prog.o:prog.c common.h
	gcc -I. -c prog.c -o prog.o
thread.o:thread_function.c common.h
	gcc -I. -c thread_function.c -o thread.o
runtest:thread.ex1 test.sh 
	./test.sh>runtest
analyser:runtest analyse log2.txt
analyse:runtest avg.sh
	./avg.sh > analyse
log2.txt:runtest speed.py analyse
	python speed.py > log2.txt
plot: scatter1.eps scatter2.eps scatter3.eps scatter4.eps scatter5.eps line.eps speedup_color.eps speedup_errorbar.eps
scatter1.eps:analyse scatter.p
	gnuplot scatter.p
scatter2.eps:analyse scatter.p
	gnuplot scatter.p
scatter3.eps:analyse scatter.p
	gnuplot scatter.p
scatter4.eps:analyse scatter.p
	gnuplot scatter.p
scatter5.eps:analyse scatter.p
	gnuplot scatter.p
line.eps:analyse lineplot.p
	gnuplot lineplot.p
speedup_color.eps:log2.txt plot_speedup.p
	gnuplot plot_speedup.p
speedup_errorbar.eps:log2.txt plot_speedup.p
	gnuplot plot_speedup.p
latex:texfile.pdf texfile
texfile.pdf:scatter1.eps scatter2.eps scatter3.eps scatter4.eps scatter5.eps line.eps speedup_color.eps speedup_errorbar.eps texfile
	pdflatex texfile
clean:
	rm -f *.o thread.ex1 *.eps log.txt log1.txt log2.txt *.pdf texfile.log texfile.aux analyse runtest
	
