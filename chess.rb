# frozen_string_literal: true

require './lib/game'

g = Game.new(pieces: Pieces.new,
             board: Board.new,
             player1: Player.new,
             player2: Player.new)
g.play
