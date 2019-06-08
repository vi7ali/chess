# frozen_string_literal: true

require './pieces/rook'
require './pieces/knight'
require './pieces/bishop'
require './pieces/queen'
require './pieces/king'
require './pieces/pawn'

# lib/pieces.rb
# Bishop class represents a bishop piece in chess
# and responds to the public interface 'moves' that
# returns an array of all of the possible
# moves(references to cells objects on the board)
# from the current position provided as an argument
class Pieces
  attr_reader :all_pieces

  def initialize
    @all_pieces = generate_pieces
  end

  private

  def generate_piece(piece:, color:)
    piece.new(color)
  end

  def generate_pieces
    all_pieces = []
    all_pieces = generate_pawns(all_pieces)
    all_pieces = generate_rooks_knights_bishops(all_pieces)
    all_pieces = generate_queens_kings(all_pieces)
    all_pieces
  end

  def generate_pawns(all_pieces)
    16.times do |i|
      color = i < 8 ? 'white' : 'black'
      all_pieces.push(generate_piece(piece: Pawn, color: color))
    end
    all_pieces
  end

  def generate_rooks_knights_bishops(all_pieces)
    4.times do |i|
      color = i < 2 ? 'white' : 'black'
      all_pieces.push(generate_piece(piece: Rook, color: color))
      all_pieces.push(generate_piece(piece: Knight, color: color))
      all_pieces.push(generate_piece(piece: Bishop, color: color))
    end
    all_pieces
  end

  def generate_queens_kings(all_pieces)
    2.times do |i|
      color = i < 1 ? 'white' : 'black'
      all_pieces.push(generate_piece(piece: Queen, color: color))
      all_pieces.push(generate_piece(piece: King, color: color))
    end
    all_pieces
  end
end
