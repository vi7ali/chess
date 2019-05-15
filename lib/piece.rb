require_relative 'init_config'

class Piece
  include InitConfig  
  attr_accessor :name, :color, :symb, :init_pos, :total_moves

  @@symbols_list = InitConfig.set_symbols

  def symbols_list
    @@symbols_list
  end
  
  def initialize(name, color, init_pos)
    @name = name
    @color = color
    @init_pos = init_pos
    @symb = set_symbol
    @total_moves = 0
  end

  def set_symbol
    symbols_list[color.to_sym][name.to_sym]
  end

end