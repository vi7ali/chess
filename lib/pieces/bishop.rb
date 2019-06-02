# frozen_string_literal: true

# lib/pieces/bishop.rb
# Bishop piece class contains the name, symbol, color,
# starting coordinates and the public interface moves
class Bishop
  attr_reader :color, :name, :directions
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'bishop'
    @color = color
    @symb = color == 'white' ? "\u2657" : "\u265D"
    @starting_coords = color == 'white' ? [[7, 2], [7, 5]] : [[0, 2], [0, 5]]
    @directions = %i[up_right up_left down_left down_right]
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
