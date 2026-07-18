# Advent of Code

My solutions to [Advent of Code](https://adventofcode.com/) puzzles, implemented in MATLAB.

## Why MATLAB?

MATLAB is my primary language from my Computational Engineering studies, 
and it's where I'm most confident writing code. I use Advent of Code as a 
way to sharpen algorithmic problem-solving within a language I already know well.

## Structure
 
```
2024/
  day1.m
  day2.m
  ...
2025/
  day1.m
  day2.m
  ...
```

## Progress

| Year | Stars |
|------|-------|
| 2024 | 25/50  |
| 2025 | 19/24  |

## What I've learned

### 2024
- File I/O and data handling for parsing puzzle input into usable formats
- Regular expressions (`regexp`) for extracting patterns from text
- Text handling and parsing (`split`, `contains`)
- Array repetition (`repmat`, `repelem`)
- Logical checks across arrays (`all`, `any`)
- Other core functions: `unique`, `fprintf`
- Bitwise operations (`bin2dec`, `bitxor`, `bitand`)
- Logical operators `||` and `&&` for combining conditions
- Using `~` as a logical NOT operator
- Solving systems of linear equations with `rref` instead of brute-forcing 
  combinations
- Working with cell arrays for handling mixed or irregular data
- Iterative problem-solving using for-loops
- Generating combinations with `nchoosek` to brute-force operator placements
- Reading raw text input with `fileread`
- Using sentinel values (`inf`, `NaN`) in cell arrays to represent "empty" 
  or placeholder data during simulation
- Implementing a small boolean logic gate simulator (AND/XOR/OR) and 
  converting the resulting bits back to decimal with `bin2dec`

### 2025
- Continued building visualizations for puzzles (Day 4, Day 7) to better 
  understand and debug problem logic
- New functions: `isbetween`, `rmmissing`, `strcat`, `convertCharsToStrings`

## Notable solutions

### 2024
- **[Day 6](2024/day6.m)**: Built a visualization of the guard's path through 
  the grid to help debug the logic and make the solution easier to understand. 
  Also used a `tic`/`toc` timeout as a practical way to detect infinite loops, 
  instead of implementing full cycle detection.
- **[Day 7](2024/day7.m)**: Used `nchoosek` to generate every possible 
  combination of operators (+ and ×) between numbers, rather than solving 
  it recursively.
- **[Day 9](2024/day9.m)**: Simulated disk defragmentation by representing 
  free space with sentinel values (`inf`/`NaN`) in cell arrays, then 
  compacting blocks from the end of the disk into the gaps.
- **[Day 11](2024/day11.m)**: The stone count grows exponentially with each 
  step, making a brute-force list impossible to handle after enough iterations. 
  It took me about a month to find the fix — instead of tracking every stone 
  individually, I split the list into unique values and their counts, solving 
  each unique value only once. Also used `parfor` to parallelize the loop 
  and speed up execution.
- **[Day 13](2024/day13.m)**: Recognized the puzzle as a system of linear 
  equations and solved it directly with `rref`, rather than searching through 
  possible button-press combinations.
- **[Day 14](2024/day14.m)**: Simulated robot movement on a grid and used a 
  `spy` visualization to search for the moment the robots formed a hidden 
  picture (a Christmas tree) — the visualization itself was the solution method, 
  not just a debugging aid.
- **[Day 24](2024/day24.m)**: Built a small logic-gate simulator that 
  evaluates AND/XOR/OR gates iteratively until the whole circuit resolves, 
  then reconstructs the binary output with `bin2dec`.

### 2025
- **[Day 3](2025/day3.m)**: Used a greedy approach to find the largest 
  possible digit at each position while still leaving enough digits for 
  the rest of the number.
- **[Day 4](2025/day4.m)**: Built a visualization of the puzzle to make the
  logic easier to follow.
- **[Day 7](2025/day7.m)**: Built a visualization of the puzzle to make the
  logic easier to follow.
- **[Day 8](2025/day8.m)**: Implemented a Kruskal's-algorithm-style approach
  to connect points by increasing distance and group them into circuits
  (connected components), stopping once all points were paired.
- **[Day 11](2025/day11.m)**: Learned and applied depth-first search (DFS)
  and breadth-first search (BFS) to solve the puzzle. Timing comparisons in
  the code show just how much the choice of algorithm mattered here — the
  DFS approach took up to ~54 hours on the hardest part of the puzzle, while
  BFS solved the same part in about 4 hours 17 minutes.
  ## License

MIT
