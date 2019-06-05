# frozen_string_literal: true

# lib/pieces/knight.rb
# Knight class represents a knight piece in chess
# and responds to the public interface 'moves' that
# returns an array of all of the possible
# moves(references to cells objects on the board)
# from the current position provided as an argument
class Knight
  attr_reader :color, :name, :directions
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'knight'
    @color = color
    @symb = color == 'white' ? "\u2658" : "\u265E"
    @starting_coords = color == 'white' ? [[7, 1], [7, 6]] : [[0, 1], [0, 6]]
    @directions = %i[up down left right]
  end

  def moves(current_pos)
    moves = generate_moves(current_pos)
    filter_moves(moves, current_pos)
  end

  private

  def generate_moves(current_pos)
    moves = []
    directions.each do |direction|
      move = current_pos.send(direction)
      next if move.nil?

      double_move = move.send(direction)
      next if double_move.nil?

      moves += select_moves(direction, double_move)
    end
    moves
  end

  def select_moves(direction, double_move)
    horizontal = %i[left right]
    return add_up_down(double_move) if horizontal.include?(direction)

    add_left_right(double_move)
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

  def filter_moves(moves, current_pos)
    filtered_moves = moves.filter do |move|
      !move.contains_piece? || move.color != current_pos.color
    end
    filtered_moves
  end
end
