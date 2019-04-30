#lib/cells.rb

require_relative 'logic'
require_relative 'square'
require_relative 'piece'

class Cells
  include Logic  
  attr_accessor :squares_collection, :pieces_collection

  @@initial_positions = Logic.get_initial_positions

  def initialize
    @pieces_collection = generate_pieces 
    @squares_collection = generate_squares
  end

  def create_piece(name, coord)
    Piece.new(name, coord)
  end

  def create_square
    Square.new(squares_collection.last, pieces_collection)
  end

  def generate_pieces
    self.pieces_collection = []

    @@initial_positions.each do |piece, positions|
      positions.length.times do |idx|
        name = piece.to_s
        coord = positions[idx]
        self.pieces_collection.push(create_piece(name, coord))
      end
    end
    return pieces_collection
  end

  def generate_squares
    self.squares_collection = []
    Logic::TOTAL_SQUARES.times do
      self.squares_collection.push(create_square)
    end
    return squares_collection
  end

  def generate_grid
    grid = []
    row = []    
    squares_collection.each do |square|
      row.push(square.content + " ")          #Adding a space for aesthetic purpose
      if row.length == Logic::TOTAL_COLUMNS
        grid.push(row)
        row = []        
      end      
    end
    grid
  end

  def to_s
    puts "Array of #{squares_collection.length} squares:"
    squares_collection.each do |square|
      square.to_s
    end
  end

  #UPDATE CELLS METHOD
end
