.PHONY: all
.PHONY: clean
.PHONY: display

all: clean square display

clean:
	rm square.s

square: square.c
	gcc -g square.c -o square.s
	
display: square
	objdump -S square -M intel 	
