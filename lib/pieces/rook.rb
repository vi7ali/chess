# frozen_string_literal: true

# lib/pieces/rook.rb
# Rook class represents a rook piece in chess
# and responds to the public interface 'moves' that
# returns an array of all of the possible
# moves(references to cells objects on the board)
# from the current position provided as an argument
class Rook
  attr_reader :color, :name, :directions
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'rook'
    @color = color
    @symb = color == 'white' ? "\u2656" : "\u265C"
    @starting_coords = color == 'white' ? [[7, 0], [7, 7]] : [[0, 0], [0, 7]]
    @directions = %i[up left down right]
  end

  def moves(current_pos)
    moves = []
    directions.each do |direction|
      move = current_pos.send(direction)
      while valid_move(move)
        moves.push(move)
        break if move.contains_piece?

        move = move.send(direction)
      end
    end
    moves
  end

  private

  def valid_move(square)
    !square.nil? && square.color != color
  end
end
