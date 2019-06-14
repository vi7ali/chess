# frozen_string_literal: true

require_relative 'cell'
# lib/cells.rb
# Cells class generates all the squares on the board,
# populates them with pieces and implements public methods
# to retrieve cells by name, coords or color and updates them
# reverse update is needed to predict the check
class Cells
  attr_reader :all_cells, :all_pieces

  def initialize(all_pieces)
    @all_pieces = all_pieces
    @all_cells = []
    generate_cells
    generate_directions
    generate_moves
  end

  def get_cell(coord)
    all_cells.each do |cell|
      return cell if cell.coord == coord
    end
    nil
  end

  def get_cell_by_name(name)
    all_cells.each do |cell|
      return cell if cell.name == name
    end
    nil
  end

  def get_pieces_of_same_color(color)
    pieces = []
    all_cells.each do |cell|
      pieces.push(cell) if cell.color == color && cell.contains_piece?
    end
    pieces
  end

  def update_cells(cell, move)
    move.update_cell(cell.piece)
    cell.update_cell
    all_cells.each(&:update_moves)
  end

  def reverse_update_cells(cell, move, cell_piece, move_piece)
    cell.update_cell(cell_piece)
    move.update_cell(move_piece)
    all_cells.each(&:update_moves)
  end

  private

  def generate_directions
    all_cells.each do |cell|
      cell.directions(self)
    end
  end

  def generate_cell
    coord = generate_coord
    Cell.new(coord, select_piece(coord))
  end

  def select_piece(coord)
    all_pieces.each do |piece|
      return piece if piece.starting_coords.include?(coord)
    end
    nil
  end

  def generate_cells
    64.times do
      all_cells.push(generate_cell)
    end
  end

  def generate_coord
    return [0, 0] if all_cells.empty?

    last = all_cells.last
    row = last.coord[0]
    column = last.coord[1]
    return [row, column + 1] if column < 7

    [row + 1, 0]
  end

  def generate_moves
    all_cells.each(&:update_moves)
  end
end
