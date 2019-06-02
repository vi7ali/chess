# frozen_string_literal: true

# lib/pieces/king.rb
# King piece class contains the name, symbol, color,
# starting coordinates and the public interface moves
class King
  attr_reader :color, :name, :directions
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'king'
    @color = color
    @symb = color == 'white' ? "\u2654" : "\u265A"
    @starting_coords = color == 'white' ? [[7, 4]] : [[0, 4]]
    @directions = %i[up down left right up_right up_left down_left down_right]
  end

  def moves(current_pos)
    moves = []
    directions.each do |direction|
      move = current_pos.send(direction)
      moves.push(move) if valid_move(move)
    end
    moves
  end

  private

  def valid_move(square)
    !square.nil? && square.color != color
  end
end
