# frozen_string_literal: true

# lib/pieces/king.rb
# King piece class contains the name, symbol, color,
# starting coordinates and the public interface moves
class King
  attr_reader :color, :name
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'king'
    @color = color
    @symb = color == 'white' ? "\u2654" : "\u265A"
    @starting_coords = color == 'white' ? [[7, 4]] : [[0, 4]]
  end

  def moves(current_pos)
    moves = up_moves(current_pos) + down_moves(current_pos)
    moves += right_moves(current_pos) + left_moves(current_pos)
    moves += up_left_moves(current_pos) + up_right_moves(current_pos)
    moves += down_left_moves(current_pos) + down_right_moves(current_pos)
    moves
  end

  private

  def up_moves(current_pos)
    moves = []
    unless current_pos.up.nil?
      unless current_pos.up.color == current_pos.color
        moves.push(current_pos.up)
      end
    end
    moves
  end

  def down_moves(current_pos)
    moves = []
    unless current_pos.down.nil?
      unless current_pos.down.color == current_pos.color
        moves.push(current_pos.down)
      end
    end
    moves
  end

  def left_moves(current_pos)
    moves = []
    unless current_pos.left.nil?
      unless current_pos.left.color == current_pos.color
        moves.push(current_pos.left)
      end
    end
    moves
  end

  def right_moves(current_pos)
    moves = []
    unless current_pos.right.nil?
      unless current_pos.right.color == current_pos.color
        moves.push(current_pos.right)
      end
    end
    moves
  end

  def up_left_moves(current_pos)
    moves = []
    unless current_pos.up_left.nil?
      unless current_pos.up_left.color == current_pos.color
        moves.push(current_pos.up_left)
      end
    end
    moves
  end

  def up_right_moves(current_pos)
    moves = []
    unless current_pos.up_right.nil?
      unless current_pos.up_right.color == current_pos.color
        moves.push(current_pos.up_right)
      end
    end
    moves
  end

  def down_left_moves(current_pos)
    moves = []
    unless current_pos.down_left.nil?
      unless current_pos.down_left.color == current_pos.color
        moves.push(current_pos.down_left)
      end
    end
    moves
  end

  def down_right_moves(current_pos)
    moves = []
    unless current_pos.down_right.nil?
      unless current_pos.down_right.color == current_pos.color
        moves.push(current_pos.down_right)
      end
    end
    moves
  end
end
