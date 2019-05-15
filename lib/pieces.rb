#lib/pieces.rb

require_relative 'init_config'
require_relative 'piece'

class Pieces
  include InitConfig
  attr_accessor :all_pieces, :moves

  @@initial_positions = InitConfig.set_initial_positions

  def initial_positions
    @@initial_positions
  end

  def initialize
    @all_pieces = generate_pieces
  end

  def generate_piece(name, color, init_pos)    
    Piece.new(name, color, init_pos)
  end

  def generate_pieces
    self.all_pieces = []

    initial_positions.each do |piece, positions|
      positions.length.times do |idx|
        name = piece.to_s
        color = positions[idx][0] > 1 ? "white" : "black"
        init_pos = positions[idx]
        self.all_pieces.push(generate_piece(name, color, init_pos))
      end
    end
    return all_pieces
  end

  def to_s
    puts "Pieces"
    all_pieces.each do |piece|
      puts "#{piece.name}, #{piece.color}, #{piece.symb}, #{piece.moves}"
    end
  end

end