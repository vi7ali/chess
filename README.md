# Command line chess game

******************
GAME IS IN ALPHA
******************

Chess is a two-player strategy board game played on a chessboard, a checkered gameboard with 64 squares arranged in an 8×8 grid.
Each player begins with 16 pieces: one king, one queen, two rooks, two knights, two bishops, and eight pawns. Each of the six piece types moves differently, with the most powerful being the queen and the least powerful the pawn. The objective is to checkmate.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

To play this game you need to have Ruby installed with the colorize gem.

Please follow [these instructions](https://www.ruby-lang.org/en/documentation/installation/) to set up and manage Ruby.

You can check if it's already installed by typing

```
ruby -v
```
This should output some information on the installed Ruby version.

If you would like to test the code, then the RSpec must be installed as well.

It can be done by typing
```
gem install rspec
```

To check if it's installed already type

```
rspec --version
```
This should output some information on the installed RSpec version.

To install colorize gem type

```
gem install colorize
```

### Running the game

  1. Fork this repo
  2. Clone it to your local computer
  3. In the command line go to the project folder
  4. Type `ruby game.rb`

## Running the tests

  1. Fork this repo
  2. Clone it to your local computer
  3. In the command line go to the project folder
  4. Type `rspec`

## TODO
  1. Implement En passant
  2. Implement Castling
  3. Add save/load functionality
  4. Add end game message and the winner announcement

## Built With

* [Ruby 2.6.1](https://www.ruby-lang.org)
* [RSpec 3.8.0](https://rspec.info/)
* [Colorize gem](https://github.com/fazibear/colorize)

## Acknowledgments

This project is one of the programming excersises from the [The Odin Project](https://www.theodinproject.com/) curriculum. 

The Odin Project is one of those "What I wish I had when I was learning" resources. Not everyone has access to a computer science education or the funds to attend an intensive coding school and neither of those is right for everyone anyway. This project is designed to fill in the gap for people who are trying to hack it on their own but still want a high quality education. 