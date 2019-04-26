#lib/cell.rb

require_relative 'piece'
require_relative 'logic'

class Cell
  include Logic
  attr_accessor :piece, :coord, :last, :last, :coord_table
  @@coord_table = Logic.generate_coord_table

  def initialize(last)
    @last = last
    @coord = generate_coord
    @piece = nil
  end

  def generate_coord
    coord = {}          #the coord that will be assigned to the cell object in hash format
    next_coord = []     #the value of the hash coord

    if last.nil?
      coord["A8"] = [0, 0]
    else
      last.coord.each_value do |prev_coord|
        if prev_coord[1] < 7
          next_coord = [prev_coord[0], prev_coord[1] + 1]
        else
          next_coord = [prev_coord[0] + 1, 0]
        end          
      end
      coord[@@coord_table.key(next_coord)] = next_coord
    end
    return coord
  end

  def to_s
    coord.each do |coordinate_human, coordinate_array|
      puts "Cell #{coordinate_human} is #{coordinate_array} and contains the piece #{piece}"
    end
  end

  #def generate_piece
  #  if coord[0].between?(0, 1) || coord[0].between?(6, 7)
  #    return Piece.new(coord)
  #  end
  #end  
end

