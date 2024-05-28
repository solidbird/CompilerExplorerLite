#CompilerExplorerLite
The idea is to make the compiler directly output the assembler code with
additional debugging information `gcc -S -masm=intel -fverbose-asm square.c -o square.c.s`.

After that we can go through the commented lines which tell you the line in the source code
with the source code line under consideration for the assembly lines that follow.

## Steps
1. Map each line of the source code with a color, line number in file and empty string for assembler in a dynamic list
2. Go through the assembler file and build a string out of the assembler blocks coresponding to the src lines
 
