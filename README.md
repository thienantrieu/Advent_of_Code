# Advent of Code

My solutions to [Advent of Code](https://adventofcode.com/) puzzles, implemented in MATLAB.

## Why MATLAB?

MATLAB is my primary language from my Computational Engineering studies, 
and it's where I'm most confident writing code. I use Advent of Code as a 
way to sharpen algorithmic problem-solving within a language I already know well.

## Progress

| Year | Stars |
|------|-------|
| 2024 | 25/50  |
| 2025 | 19/24  |

## What I've learned

### 2024
- File I/O and data handling for parsing puzzle input into usable formats
- Regular expressions (`regexp`) for extracting patterns from text
- Core MATLAB functions for problem-solving: `split`, `repmat`, `repelem`, 
  `bitxor`, `contains`
- Working with cell arrays for handling mixed or irregular data
- Iterative problem-solving using for-loops

### 2025
- 

## Notable solutions

### 2024
- **[Day 11](2024/day11.m)**: The stone count grows exponentially with each 
  step, making a brute-force list impossible to handle after enough iterations. 
  It took me about a month to find the fix — instead of tracking every stone 
  individually, I split the list into unique values and their counts, solving 
  each unique value only once.
- **[Day 6](2024/day06.m)**: Built a visualization of the guard's path through 
  the grid to help debug the logic and make the solution easier to understand.

### 2025
- [add as you go]
  ## License

MIT
