.PHONY: all
.PHONY: clean

all: clean main

clean:
	rm main

main: main.c
	gcc -ggdb main.c -o main -Iincludes -lraylib

