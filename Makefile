.PHONY: all
.PHONY: clean

all: clean main

clean:
	rm main

main: main.c
	gcc -ggdb -D _GNU_SOURCE main.c map_src_list.c -o main -Iincludes -lraylib

