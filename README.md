# It's a Random Number Guessing Game

This is a simple assembler (`.asm`) program that generates a random number between 0 and 9, and the user has to guess the number.

## How to Play

1. The program will prompt you to enter a seed (a number between 0 and 9) and the number of cycles (between 1 and 9).
2. The program will then generate a random number based on the seed and the number of cycles.
3. You will be prompted to guess the random number.
4. If your guess is too high, the program will tell you to try a lower number.
5. If your guess is too low, the program will tell you to try a higher number.
6. Once you guess the correct number, the program will congratulate you.

## How it Works

The program uses a simple linear congruential generator (LCG) to generate the random number. The formula used is:

```
seed = (a * seed + c) % modulus
```

Where:
- `a` is a constant (4 in this case)
- `c` is a constant (1 in this case)
- `modulus` is a constant (9 in this case)

The program then uses this generated random number as the target for the user to guess.

## How to Run

To run this program, you will need an assembler, such as MASM (Microsoft Macro Assembler) or NASM (Netwide Assembler). Once you have an assembler installed, you can compile and run the program using the following steps:

1. Save the `.asm` file to your local machine.
2. Open the file with the IDLE/GUI/Text editor of your preference, I'm using the GUI of Turbo Assembler.
2.1. Alternatively, open a command prompt or terminal and navigate to the directory where you saved the file.
3. Compile the program using your assembler. 
