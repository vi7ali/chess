#lib/pieces.rb

require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'

class Pieces  
  attr_accessor :all_pieces, :moves

  def initialize
    @all_pieces = generate_pieces
  end

  def generate_piece(piece:, color:)
    piece.new(color)
  end

  def generate_pieces
    all_pieces = []
    all_pieces = generate_pawns(all_pieces)
    all_pieces = generate_rooks(all_pieces)
    all_pieces = generate_knights(all_pieces)
    all_pieces = generate_bishops(all_pieces)
    all_pieces = generate_queens(all_pieces)
    all_pieces = generate_kings(all_pieces)
    return all_pieces
  end

  def generate_pawns(all_pieces)    
    16.times do |i|
      color = i < 7 ? "white" : "black"
      all_pieces.push(generate_piece(piece: Pawn, color: color))
    end
    return all_pieces
  end

  def generate_rooks(all_pieces)    
    4.times do |i|
      color = i < 2 ? "white" : "black"
      all_pieces.push(generate_piece(piece: Rook, color: color))
    end
    return all_pieces
  end

  def generate_knights(all_pieces)    
    4.times do |i|
      color = i < 2 ? "white" : "black"
      all_pieces.push(generate_piece(piece: Knight, color: color))
    end
    return all_pieces
  end

  def generate_bishops(all_pieces)    
    4.times do |i|
      color = i < 2 ? "white" : "black"
      all_pieces.push(generate_piece(piece: Bishop, color: color))
    end
    return all_pieces
  end

  def generate_queens(all_pieces)    
    2.times do |i|
      color = i < 1 ? "white" : "black"
      all_pieces.push(generate_piece(piece: Queen, color: color))
    end
    return all_pieces
  end

  def generate_kings(all_pieces)    
    2.times do |i|
      color = i < 1 ? "white" : "black"
      all_pieces.push(generate_piece(piece: King, color: color))
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