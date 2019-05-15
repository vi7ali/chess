class Logic
  attr_accessor :cells, :pieces
  def initialize(cells, pieces)
    @cells = cells
    #@pieces = pieces
  end

  def get_king(color)
    cells.all_cells.each do |square|
      if square.contains_piece?
        if square.color == color && square.piece.name == "king"
          return square
        end
      end
    end
  end

  def stalemate?(color)
    king = get_king(color)
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
    return false
  end

  def king_in_check?(king)
    cells.all_cells.each do |cell|
      moves = get_moves(cell)
      return true if moves.include?(king.name)
    end
    return false
  end

  def own_king_in_check?(cell, move)
    color = cell.color
    c_piece = cell.piece
    m_piece = move.piece
    #Make a move
    #Get the king AFTER the move
    #Check if any of the cells moves contain a king coordinate
    #Revert a move and return the response
    cells.update_cells(cell, move)
    king = get_king(color)
    response = king_in_check?(king)
    cells.reverse_update_cells(cell, move, c_piece, m_piece)
    return response
  end

  def valid_move?(cell, move)
    moves = get_moves(cell)    
    if moves.include?(move.name) && !own_king_in_check?(cell, move)
      return true
    else
      return false
    end
  end

  def end_game?(current_player)
    opponent_color = current_player.color == "white" ? "black" : "white"
    opponent_king = get_king(opponent_color)
    return true if king_in_mate?(opponent_king) || 
                   stalemate?(current_player.color) ||
                   resign?(current_player)
    return false
  end

  def resign?(player)
    puts "#{player.name}, to resign type \"r\" or Enter to continue"
    resign = gets.chomp!
    return true if resign == "r"
    return false
  end

  def select_cell(current_player)
    cell = nil
    loop do
      puts "#{current_player.name}, please select a #{current_player.color} piece"
      cell_name = gets.chomp!.upcase
      cell = cells.get_cell_by_name(cell_name)
      unless cell.nil?
        if !cell.piece.nil? && cell.color == current_player.color && !cell.moves.empty?          
          break
        end
      end
      puts "Invalid selection"
    end
    return cell
  end

  def select_move(cell)
    move = nil
    moves = get_moves(cell)
    loop do
      puts "Please select a cell to move to"
      puts "Moves available: #{moves}"   
      cell_name = gets.chomp!.upcase
      move = cells.get_cell_by_name(cell_name)
      unless move.nil?
        break
      end      
    end
    return move
  end

  def get_moves(cell)
    moves = []
    cell.moves.each do |square|
      moves.push(square.name)
    end
    moves
  end

end
