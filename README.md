# hangman
A shell version of the hangman game, with the option of saving game progress.

![Game_Screenshot](screenshots/gameplay.png?raw=true "Gameplay")

#### Starting a New Game

```ruby
require 'hangman'

Game.new.play
```
---

#### Saving a Game

To save a game just type `save` at any time during the game.

![Game_Screenshot](screenshots/save.png?raw=true "Gameplay")

---

#### Loading a Saved Game

```ruby
Game.load
```
