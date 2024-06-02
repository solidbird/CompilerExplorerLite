.PHONY: all
.PHONY: clean

all: clean square.c.s

clean:
	rm square.c.s

square.c.s: square.c
	gcc -S -masm=intel -fverbose-asm square.c -o square.c.s
