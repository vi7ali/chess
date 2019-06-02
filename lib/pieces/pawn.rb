# frozen_string_literal: true

# lib/pieces/pawn.rb
# Pawn piece class contains the name, symbol, color,
# starting coordinates, starting_row and
# the public interface moves
class Pawn
  attr_reader :color, :name
  attr_accessor :symb, :starting_row, :starting_coords

  def initialize(color)
    @name = 'pawn'
    @color = color
    @symb = color == 'white' ? "\u2659" : "\u265F"
    @starting_row = color == 'white' ? 6 : 1
    @starting_coords = nil
    select_starting_coords
  end

  def moves(current_pos)
    return white_moves(current_pos) if color == 'white'

    black_moves(current_pos)
  end

  private

  def select_starting_coords
    if color == 'white'
      self.starting_coords = [[6, 0], [6, 1], [6, 2], [6, 3],
                              [6, 4], [6, 5], [6, 6], [6, 7]]
    else
      self.starting_coords = [[1, 0], [1, 1], [1, 2], [1, 3],
                              [1, 4], [1, 5], [1, 6], [1, 7]]
    end
  end

  def current_row(square)
    square.coord[0]
  end

  # WHITE MOVES
  def white_moves(current_pos)
    up = current_pos.up
    up_left = current_pos.up_left
    up_right = current_pos.up_right
    moves = white_vertical_moves(up, current_row(current_pos))
    moves + white_diagonal_moves(up_left, up_right, current_pos.color)
  end

  def white_vertical_moves(up, current_row)
    moves = []
    moves.push(up) if valid_vertical_move(up)
    if current_row == starting_row && valid_vertical_move(up)
      moves.push(up.up) if valid_vertical_move(up.up)
    end
    moves
  end

  def white_diagonal_moves(up_left, up_right, color)
    moves = []
    moves.push(up_left) if valid_diagonal_move(up_left, color)
    moves.push(up_right) if valid_diagonal_move(up_right, color)
    moves
  end

  # BLACK MOVES
  def black_moves(current_pos)
    down = current_pos.down
    down_left = current_pos.down_left
    down_right = current_pos.down_right
    moves = black_vertical_moves(down, current_row(current_pos))
    moves + black_diagonal_moves(down_left, down_right, current_pos.color)
  end

  def black_vertical_moves(down, current_row)
    moves = []
    moves.push(down) if valid_vertical_move(down)
    if current_row == starting_row && valid_vertical_move(down)
      moves.push(down.down) if valid_vertical_move(down.down)
    end
    moves
  end

  def black_diagonal_moves(down_left, down_right, color)
    moves = []
    moves.push(down_left) if valid_diagonal_move(down_left, color)
    moves.push(down_right) if valid_diagonal_move(down_right, color)
    moves
  end

  def valid_diagonal_move(square, color)
    !square.nil? && square.contains_piece? && square.color != color
  end

  def valid_vertical_move(square)
    !square.nil? && !square.contains_piece?
  end
end
