#lib/cells.rb

require_relative 'cell'

class Cells
  TOTAL = 64
  attr_accessor :cells_collection

  def initialize    
    @cells_collection = generate_cells
  end

  def generate_cells    
    self.cells_collection = []
    TOTAL.times do
      self.cells_collection.push(create_cell)
    end
    return cells_collection
  end

  def create_cell
    Cell.new(cells_collection.last)    
  end

  def to_s
    puts "Array of #{cells_collection.length} cells:"
    cells_collection.each do |cell|
      cell.to_s
    end
  end

  #UPDATE CELLS METHOD  
end
