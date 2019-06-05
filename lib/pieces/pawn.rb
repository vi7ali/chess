# frozen_string_literal: true

# lib/pieces/pawn.rb
# Pawn class represents a pawn piece in chess
# and responds to the public interface 'moves' that
# returns an array of all of the possible
# moves(references to cells objects on the board)
# from the current position provided as an argument
class Pawn
  attr_reader :color, :name
  attr_accessor :symb, :starting_row, :starting_coords, :directions

  def initialize(color)
    @name = 'pawn'
    @color = color
    @symb = color == 'white' ? "\u2659" : "\u265F"
    @starting_row = color == 'white' ? 6 : 1
    @starting_coords = set_starting_coords
    @directions = set_directions
  end

  def moves(current_pos)
    moves = []
    directions.each do |direction|
      move = current_pos.send(direction)
      moves.push(move) if valid_diagonal_move?(move)
      if %i[up down].include?(direction)
        double_move = move.send(direction)
        moves += vertical_moves(move, double_move, current_pos)
      end
    end
    moves
  end

  private

  def set_starting_coords
    if color == 'white'
      return [[6, 0], [6, 1], [6, 2], [6, 3],
              [6, 4], [6, 5], [6, 6], [6, 7]]
    end
    [[1, 0], [1, 1], [1, 2], [1, 3],
     [1, 4], [1, 5], [1, 6], [1, 7]]
  end

  def set_directions
    return %i[up up_left up_right] if color == 'white'

    %i[down down_left down_right]
  end

  def current_row(square)
    square.coord[0]
  end

  def vertical_moves(move, double_move, current_pos)
    moves = []
    moves.push(move) if valid_vertical_move?(move)
    moves.push(double_move) if valid_double_move?(current_pos, double_move)
    moves
  end

  def valid_diagonal_move?(square)
    !square.nil? && square.contains_piece? && square.color != color
  end

  def valid_vertical_move?(square)
    !square.nil? && !square.contains_piece?
  end

  def valid_double_move?(current_pos, double_move)
    current_row(current_pos) == starting_row && valid_vertical_move?(double_move)
  end
end
