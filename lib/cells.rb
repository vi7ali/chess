#lib/cells.rb

require_relative 'init_config'
require_relative 'cell'

class Cells
  include InitConfig
  attr_reader :all_cells, :all_pieces

  def initialize(all_pieces)
    @all_pieces = all_pieces
    @all_cells = []
    generate_cells
    InitConfig.generate_directions(self)
    generate_moves
  end

  def generate_cell
    piece = nil
    coord = generate_coord
    all_pieces.each do |pce|
      piece = pce if pce.starting_coords.include?(coord)
    end
    Cell.new(coord, piece)
  end

  def generate_cells
    64.times do
      all_cells.push(generate_cell)
    end
  end

  def generate_coord
    last = all_cells.last
    return [0, 0] if last.nil?

    last_row = last.coord[0]
    last_column = last.coord[1]
    return [last_row, last_column + 1] if last_column < 7

    [last_row + 1, 0]
  end

  def generate_moves
    all_cells.each(&:update_moves)
  end

  def get_pieces_of_same_color(color)
    pieces = []
    all_cells.each do |cell|
      pieces.push(cell) if cell.color == color && cell.contains_piece?
    end
    pieces
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
end
