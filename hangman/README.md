# Hangman (Ruby CLI Game)

A **command-line Hangman game** built entirely with **Object-Oriented Programming (OOP)** concepts in Ruby.  
The computer randomly selects a secret word, the player must guess it letter by letter before running out of lives.
The game supports saving progress and loading a previous session, allowing players to continue right where they left off.

---

## Features
- Playable directly in the terminal
- Randomly selected words between 5–12 letters
- Turn-based gameplay with 7 allowed mistakes
- Track correctly guessed letters in real time
- Save your progress at any moment and load it later
- Simple, readable OOP structure with separate classes (Game, Player, GameSave, Serializer)

---

## What I Learned
Building this project helped me:
- Understand and apply **OOP principles**: classes, instance variables, encapsulation
- Use **attr_accessor** and **attr_reader** for managing object state
- Organize code across multiple files and connect them with `require_relative`
- Handle **user input** (`gets.chomp`) and **loops** for turn-based gameplay
- Saving and loading state using Ruby's Marshal serialization
- Write cleaner, modular and maintainable code for complex game logic

---

## Challenges
As always, the game was very challenging and worth investing a lot of time. The most difficult parts were: 1. designing a clean separation between Game, Player and GameSave; 2. Implementing the save/load feature correctly, ensuring the game resumes from the exact point of exit;
3. managing shared state (like guessed letters, remaining turns and the blank word) without breaking encapsulation; 4. preventing the game loop from restarting the word or resetting the turns when loading a save. Through this project I learned the value of structuring logic into small, focused problems and keeping each class responsible for just one thing. Althouh, I think I met the requirements of the game, I feel i still need more practice with serialization, escpecially writing codes for saving and loading game_state. In general, I spent approximately 3 weeks to complete all 3 games. 

---

## How to Play
1. Make sure to clone the repository and open the project folder.
2. Run the game from the terminal:
   ```bash
   ruby main.rb