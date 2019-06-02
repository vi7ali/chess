# frozen_string_literal: true

# lib/pieces/bishop.rb
# Bishop piece class contains the name, symbol, color,
# starting coordinates and the public interface moves
class Bishop
  attr_reader :color, :name
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'bishop'
    @color = color
    @symb = color == 'white' ? "\u2657" : "\u265D"
    @starting_coords = color == 'white' ? [[7, 2], [7, 5]] : [[0, 2], [0, 5]]
  end

  def moves(current_pos)
    moves = up_left_moves(current_pos)
    moves += up_right_moves(current_pos)
    moves += down_left_moves(current_pos)
    moves += down_right_moves(current_pos)
    moves
  end

  private

  def up_left_moves(current_pos)
    moves = []
    up_left = current_pos.up_left
    until up_left.nil? || up_left.color == current_pos.color
      moves.push(up_left)
      break if up_left.contains_piece?

      up_left = up_left.up_left
    end
    moves
  end

  def up_right_moves(current_pos)
    moves = []
    up_right = current_pos.up_right
    until up_right.nil? || up_right.color == current_pos.color
      moves.push(up_right)
      break if up_right.contains_piece?

      up_right = up_right.up_right
    end
    moves
  end

  def down_left_moves(current_pos)
    moves = []
    down_left = current_pos.down_left
    until down_left.nil? || down_left.color == current_pos.color
      moves.push(down_left)
      break if down_left.contains_piece?

      down_left = down_left.down_left
    end
    moves
  end

  def down_right_moves(current_pos)
    moves = []
    down_right = current_pos.down_right
    until down_right.nil? || down_right.color == current_pos.color
      moves.push(down_right)
      break if down_right.contains_piece?

      down_right = down_right.down_right
    end
    moves
  end
end
