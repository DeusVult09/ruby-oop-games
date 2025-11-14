# Mastermind (Ruby CLI Game)

A **command-line Mastermind game** built entirely with **Object-Oriented Programming (OOP)** concepts in Ruby.  
The player can choose to be the **Codebreaker** or the **Mastermind**. The game supports human vs computer gameplay with colorized feedback.

---

## Features
- Playable directly in the terminal
- Choose your role: Codebreaker or Mastermind
- Human and computer players supported
- Feedback with **RED PEGS** (correct color + position) and **WHITE PEGS** (correct color, wrong position)
- 12-rounds to guess the code
- Colorized output in the terminal using the `colorize` gem
- Option to restart the game after it finishes

---

## What I Learned
Building this project helped me:
- Understand and apply **OOP principles**: classes, instance variables, encapsulation
- Use **attr_accessor** and **attr_reader** for managing object state
- Organize code across multiple files and connect them with `require_relative`
- Handle **user input** (`gets.chomp`) and **loops** for turn-based gameplay
- Work with **arrays** and logic for checking guesses and providing feedback
- Write cleaner, modular, and maintainable code for complex game logic

---

## Challenges
As always, the game was very challenging and worth investing a lot of time. Structuring the game with separate classes (Board, Mastermind, Codebreaker, Game) and coordinating interactions between them was the hardest part. Implementing the **feedback system** with red and white pegs and handling both **human and computer roles** required careful planning. I learned that creating separate methods and classes are super important because they prevent the entire logic from cluttering and bloat. I faced that problem personally. Thus, had to restructure and replane namy times. Managing rounds and restarts also took some trial and error.

---

## How to Play
1. Make sure to clone the repository and open the project folder.
2. Run the game from the terminal:
   ```bash
   ruby main.rb