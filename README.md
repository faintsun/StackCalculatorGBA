# Stack Calculator
This stack calculator is written for the Gameboy Advance and utilizes the mode 4 display. It supports input with the GBA controls and can  swap, shift down, and shift up elements. It allows the user to perform the following operations on binary, octal, decimal, and hexidecimal numbers:
- Addition (+)
- Subtraction (-)
- Multiplication (*)
- Integer Division (/)
- Boolean-And (&&)
- Boolean-Or (||)
- Boolean-Not (!)
- Bitwise-And (&)
- Bitwise-Or (|)
- Bitwise-Xor (^)
- Complement (~)
- Bitshift-Left (<<)
- Bitshift-Right (>>)

## Controls
- Start: shift up
- Select: shift down
- A: cycle through operations
- B: execute current operation
- Left Shoulder: swap top of stack with the next element
- Right Shoulder: change base
- Up: increase highlighted digit
- Down: decrete highlighted digit
- Left: move highlight to the left
- Right: move highlight to the right

## How to Run
Open the StackCalculator.GBA file with a Gameboy Advance Emulator. VisualBoyAdvance is recommended.

## How to Build
Requirements:
- devkitARM - https://sourceforge.net/projects/devkitpro/files/devkitARM/devkitARM_r47/ 
- a C compiler
- GBA emulator

Download and open project in a text editor - Sublime Text is recommended. 
In the makefile, the CCPATH, DKPATH, and VBASIM must be updated with the paths to your C compiler bin, devkitARM bin, and GBA emulator .exe respectively. 
