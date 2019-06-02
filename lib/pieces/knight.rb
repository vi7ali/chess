# frozen_string_literal: true

# lib/pieces/knight.rb
# Knight piece class contains the name, symbol, color,
# starting coordinates and the public interface moves
class Knight
  attr_reader :color, :name
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'knight'
    @color = color
    @symb = nil
    @starting_coords = nil
    post_init
  end

  def moves(current_pos)
    moves = two_up_moves(current_pos.up)
    moves += two_right_moves(current_pos.right)
    moves += two_left_moves(current_pos.left)
    moves += two_down_moves(current_pos.down)
    moves.filter! do |square|
      !square.contains_piece? || square.color != current_pos.color
    end
    moves
  end

  private

  def post_init
    if color == 'white'
      self.symb = "\u2658"
      self.starting_coords = [[7, 1], [7, 6]]
    else
      self.symb = "\u265E"
      self.starting_coords = [[0, 1], [0, 6]]
    end
  end

  def two_up_moves(up)
    moves = []
    unless up.nil?
      moves = add_left_right(up.up) unless up.up.nil?
    end
    moves
  end

  def two_down_moves(down)
    moves = []
    unless down.nil?
      moves = add_left_right(down.down) unless down.down.nil?
    end
    moves
  end

  def two_left_moves(left)
    moves = []
    unless left.nil?
      moves = add_up_down(left.left) unless left.left.nil?
    end
    moves
  end

  def two_right_moves(right)
    moves = []
    unless right.nil?
      moves = add_up_down(right.right) unless right.right.nil?
    end
    moves
  end

  def add_up_down(square)
    moves = []
    moves.push(square.up) unless square.up.nil?
    moves.push(square.down) unless square.down.nil?
    moves
  end

  def add_left_right(square)
    moves = []
    moves.push(square.left) unless square.left.nil?
    moves.push(square.right) unless square.right.nil?
    moves
  end
end
