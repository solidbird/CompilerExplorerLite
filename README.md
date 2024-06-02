#CompilerExplorerLite

The idea is to make the compiler directly output the assembler code with
additional debugging information `gcc -S -masm=intel -fverbose-asm square.c -o square.c.s`.

After that we can go through the commented lines which tell you the line in the source code
with the source code line under consideration for the assembly lines that follow.

## Steps
1. Group asm_block into one src_line
2. Make a function that builds us the function from asm
3. Compare our src_lines with the actial src file
4. Add missing lines to the linked list but without any special color ir asm_block etc.

## Additional Ideas
- When clicking on a line (no mater if src code line or asm block) play animation to show
clear comparison between src and asm.

 
