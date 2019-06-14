# frozen_string_literal: true

# lib/logic.rb
# Logic class checks the end game conditions
# gets a valid cell and move selections
class Logic
  attr_reader :cells
  def initialize(cells)
    @cells = cells
  end

  def end_game(current_player)
    opponent_color = current_player.color == 'white' ? 'black' : 'white'
    opponent_king = get_king(opponent_color)
    return 'mate' if king_in_mate?(opponent_king)
    return 'stalemate' if stalemate?(current_player.color)
    return 'resign' if resign?(current_player)

    false
  end

  def select_cell(current_player)
    cell = nil
    loop do
      puts "#{current_player.name}, please select a #{current_player.color} piece"
      cell = cells.get_cell_by_name(gets.chomp!.upcase)
      break if valid_selection?(cell, current_player)

      puts 'Invalid selection'
    end
    cell
  end

  def select_move(cell)
    move = nil
    moves = get_moves(cell)
    loop do
      puts 'Please select a cell to move to'
      puts "Moves available: #{moves}"
      cell_name = gets.chomp!.upcase
      move = cells.get_cell_by_name(cell_name)
      break unless move.nil?
    end
    move
  end

  def valid_move?(cell, move)
    moves = get_moves(cell)
    return true if moves.include?(move.name) && !own_king_in_check?(cell, move)

    false
  end

  private

  def get_king(color)
    cells.all_cells.each do |square|
      if square.contains_piece?
        return square if square.color == color && square.piece.name == 'king'

      end
      next
    end
  end

  def stalemate?(color)
    moves = []
    pieces = cells.get_pieces_of_same_color(color)
    pieces.each do |piece|
      piece.moves.each do |move|
        moves.push(move.name) if valid_move?(piece, move)
      end
    end
    moves.empty?
  end

  def king_in_mate?(king)
    pieces = cells.get_pieces_of_same_color(king.color)
    if king_in_check?(king)
      pieces.each do |piece|
        piece.moves.each do |move|
          return false unless own_king_in_check?(piece, move)
        end
      end
      return true
    end
    false
  end

  def king_in_check?(king)
    cells.all_cells.each do |cell|
      moves = get_moves(cell)
      return true if moves.include?(king.name)
    end
    false
  end

  def own_king_in_check?(cell, move)
    color = cell.color
    c_piece = cell.piece
    m_piece = move.piece
    cells.update_cells(cell, move)
    king = get_king(color)
    response = king_in_check?(king)
    cells.reverse_update_cells(cell, move, c_piece, m_piece)
    response
  end

  def resign?(player)
    puts "#{player.name}, to resign type \"r\" or Enter to continue"
    resign = gets.chomp!
    return true if resign == 'r'

    false
  end

  def valid_selection?(cell, current_player)
    !cell.nil? && !cell.piece.nil? && cell.color == current_player.color && !cell.moves.empty?
  end

  def get_moves(cell)
    moves = []
    cell.moves.each do |square|
      moves.push(square.name)
    end
    moves
  end
end
