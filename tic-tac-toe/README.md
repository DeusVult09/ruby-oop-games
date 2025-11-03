# Tic-Tac-Toe (Ruby CLI Game)

A very simple **command-line Tic-Tac-Toe** game built entirely with **Object-Oriented Programming (OOP)** concepts in Ruby.  
Two human players take turns placing their marks (`X` and `O`) on a 3D grid until one wins or the game ends in a draw.

---

## Features
- Playable directly in the terminal
- Two-player mode (no computer AI)
- Grid updates after each move dinamically
- Win and tie results
- Clear turn-based prompts
- Ckecking input and updating the grid

---

## What I Learned
Building this project helped me:
- Understand and apply **OOP principles** (e.g classes, instance variables, encapsulation etc.)
- Use **attr_accessor** for managing object state
- Work with **arrays** and flow control to handle game logic
- Use **loops** and user input (`gets.chomp`) to recive inputs from players
- Organize code across multiple files and connect them with `require_relative`
- Write cleaner DRY codes(at least I tried) for readability and maintainability

## Challenges
It took me a great effort and some time to structure the game into multiple classes (Board, Player, Game). Additionally, I had challenges to come up with the right logic to detect winners. Tracking player's moves while keeping some methods private was also a task of its own. In the long run, I still managed to complete the task even with struggles but the journey was worth it since I learnt a lot along the way.
---

## How to Play
1. Make sure to clone the repository and open the project folder.
2. Run the game from the terminal:
   ```bash
   ruby main.rb
