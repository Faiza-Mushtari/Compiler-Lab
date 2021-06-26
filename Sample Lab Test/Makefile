#use command "make main SHELL=cmd"

main: test1.l
	lex test1.l
	gcc lex.yy.c
	./a <input1.txt> output1.txt

main2: test2.l test2.y
	bison -d test2.y
	lex test2.l
	gcc test2.tab.c lex.yy.c
	./a <input2.txt> output2.txt
