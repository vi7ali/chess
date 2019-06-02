# frozen_string_literal: true

# lib/pieces/knight.rb
# Knight piece class contains the name, symbol, color,
# starting coordinates and the public interface moves
class Knight
  attr_reader :color, :name, :vertical_directions, :horizontal_directions
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = 'knight'
    @color = color
    @symb = color == 'white' ? "\u2658" : "\u265E"
    @starting_coords = color == 'white' ? [[7, 1], [7, 6]] : [[0, 1], [0, 6]]
    @vertical_directions = %i[up down]
    @horizontal_directions = %i[left right]
  end

  def moves(current_pos)
    moves = vertical_moves(current_pos)
    moves += horizontal_moves(current_pos)
    moves.filter! do |move|
      !move.contains_piece? || move.color != current_pos.color
    end
    moves
  end

  private

  def vertical_moves(current_pos)
    moves = []
    vertical_directions.each do |direction|
      move = current_pos.send(direction)
      unless move.nil?
        double_move = move.send(direction)
        moves += add_left_right(double_move) unless double_move.nil?
      end
    end
    moves
  end

  def horizontal_moves(current_pos)
    moves = []
    horizontal_directions.each do |direction|
      move = current_pos.send(direction)
      unless move.nil?
        double_move = move.send(direction)
        moves += add_up_down(double_move) unless double_move.nil?
      end
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
