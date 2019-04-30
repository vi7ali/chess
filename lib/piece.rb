require_relative 'logic'

class Piece
  include Logic
  attr_accessor :name, :coord, :color, :symb

  @@symbols = Logic.get_symbols
  
  def initialize(name, coord)
    @name = name
    @coord = coord
    @color = get_color
    @symb = get_symbol
  end

  def get_color
    return "white" if coord[0] > 1
    return "black"
  end

  def get_symbol
    @@symbols[color.to_sym][name.to_sym]
  end

end