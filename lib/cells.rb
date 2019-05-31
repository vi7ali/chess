#lib/cells.rb

require_relative 'init_config'
require_relative 'cell'

class Cells
  include InitConfig
  attr_accessor :all_cells, :all_pieces

  def initialize(all_pieces)
    @all_pieces = all_pieces
    @all_cells = generate_cells
    InitConfig.generate_directions(self)
    generate_moves
  end

  def generate_cell
    piece = nil
    coord = generate_coord
    name = InitConfig.get_cell_name(coord)
    all_pieces.each do |pce|
      if pce.init_pos == coord
        piece = pce
      end
    end
    Cell.new(coord, piece, name)
  end


  def generate_cells
    self.all_cells = []
    InitConfig::TOTAL_CELLS.times do
      self.all_cells.push(generate_cell)
    end
    return all_cells
  end  

  def generate_coord
    last = all_cells.last
    coord = []
    if last.nil?
      coord = [0, 0]
    else      
      if last.coord[1] < 7
        coord = [last.coord[0], last.coord[1] + 1]
      else
        coord = [last.coord[0] + 1, 0]
      end
    end
    return coord
  end

  def generate_moves
    all_cells.each do |cell|
      cell.update_moves
    end
  end

  def get_pieces_of_same_color(color)
    pieces = []
    all_cells.each do |cell|
      pieces.push(cell) if cell.color == color && cell.contains_piece?
    end
    return pieces
  end

  def get_cell(coord)
    all_cells.each do |cell|
      return cell if cell.coord == coord
    end
      return nil
  end

  def get_cell_by_name(name)
    all_cells.each do |cell|
      return cell if cell.name == name
    end
      return nil
  end  

  def update_cells(cell, move)
    move.update_cell(cell.piece)
    cell.update_cell()
    all_cells.each do |cell|
      cell.update_moves
    end
  end

  def update_cells_en_passant(cell, move)
    move.update_cell(cell.piece)
    if cell.color == "white"
      cell.down.update_cell()
    else
      cell.up.update_cell()
    end
    cell.update_cell()
  end

  def reverse_update_cells(cell, move, cell_piece, move_piece)
    cell_piece.total_moves -= 1    
    cell.update_cell(cell_piece)
    move.update_cell(move_piece)
    all_cells.each do |cell|
      cell.update_moves
    end
  end

  def to_s
    puts "Array of #{all_cells.length} cells:"
    all_cells.each do |cell|
      cell.show
    end
  end  
end