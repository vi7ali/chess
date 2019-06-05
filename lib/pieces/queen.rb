# frozen_string_literal: true

# lib/pieces/queen.rb
# Queen class represents a queen piece in chess
# and responds to the public interface 'moves' that
# returns an array of all of the possible
# moves(references to cells objects on the board)
# from the current position provided as an argument
class Queen
  attr_reader :color, :name, :directions
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'queen'
    @color = color
    @symb = color == 'white' ? "\u2655" : "\u265B"
    @starting_coords = color == 'white' ? [[7, 3]] : [[0, 3]]
    @directions = %i[up down left right up_right up_left down_left down_right]
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
