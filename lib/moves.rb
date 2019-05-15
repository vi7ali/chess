module Moves
  extend self

  def get_moves(cell)
    moves = []

    #black pawn standart moves
    if cell.color == "black" && cell.piece.name == "pawn"
      moves = get_black_pawn_moves(cell)
    else
      case cell.piece.name
      when "pawn"
        moves = get_pawn_moves(cell)
      when "rook"
        moves = get_rook_moves(cell)
      when "knight"
        moves = get_knight_moves(cell)
      when "bishop"
        moves = get_bishop_moves(cell)
      when "queen"
        moves = get_queen_moves(cell)
      when "king"
        moves = get_king_moves(cell)
      else
        moves = "f*ck"
      end       
      return moves
    end
  end

  def get_black_pawn_moves(cell)
    moves = []
    #Vertical moves
    unless cell.down.nil?      
      unless cell.down.contains_piece?
        moves.push(cell.down)
        #first move
        if cell.coord[0] == 1 && !cell.down.down.contains_piece?
          moves.push(cell.down.down)
        end
      end
    end
    #Diagonal moves
    unless cell.down_left.nil?
      if cell.down_left.contains_piece? && cell.down_left.color != cell.color
        moves.push(cell.down_left)
      end
    end    
    unless cell.down_right.nil?
      if cell.down_right.contains_piece? && cell.down_right.color != cell.color
        moves.push(cell.down_right)
      end
    end
    #En passant
    unless cell.left.nil?
      if cell.left.contains_piece? && cell.left.piece.name == "pawn"
        if cell.left.color != cell.color && cell.left.enpassant?
          moves.push(cell.down_left)
        end
      end
    end
    unless cell.right.nil?
      if cell.right.contains_piece? && cell.right.piece.name == "pawn"
        if cell.right.color != cell.color && cell.right.enpassant?
          moves.push(cell.down_right)
        end
      end
    end
    return moves
  end

  def get_pawn_moves(cell)
    moves = []
    #Vertical moves
    unless cell.up.nil?      
      unless cell.up.contains_piece?
        moves.push(cell.up)
        #first move
        if cell.coord[0] == 6 && !cell.up.up.contains_piece?
          moves.push(cell.up.up)
        end
      end
    end
    #Diagonal moves
    unless cell.up_left.nil?
      if cell.up_left.contains_piece? && cell.up_left.color != cell.color
        moves.push(cell.up_left)
      end
    end
    unless cell.up_right.nil?
      if cell.up_right.contains_piece? && cell.up_right.color != cell.color
        moves.push(cell.up_right)
      end
    end
    #En passant
    unless cell.left.nil?
      if cell.left.contains_piece? && cell.left.piece.name == "pawn"
        if cell.left.color != cell.color && cell.left.enpassant?
          moves.push(cell.up_left)
        end
      end
    end
    unless cell.right.nil?
      if cell.right.contains_piece? && cell.right.piece.name == "pawn"
        if cell.right.color != cell.color && cell.right.enpassant?
          moves.push(cell.up_right)
        end
      end
    end
    return moves
  end

  def get_rook_moves(cell)
    moves = []
    move_up = cell.up
    move_down = cell.down
    move_left = cell.left
    move_right = cell.right
    
    until move_up.nil?      
      if move_up.contains_piece? && move_up.color != cell.color          
        moves.push(move_up)
        break
      elsif move_up.contains_piece? && move_up.color == cell.color
        break
      else
        moves.push(move_up)
        move_up = move_up.up
      end
    end

    until move_down.nil?      
      if move_down.contains_piece? && move_down.color != cell.color          
        moves.push(move_down)
        break
      elsif move_down.contains_piece? && move_down.color == cell.color
        break
      else
        moves.push(move_down)
        move_down = move_down.down
      end
    end

    until move_left.nil?      
      if move_left.contains_piece? && move_left.color != cell.color          
        moves.push(move_left)
        break
      elsif move_left.contains_piece? && move_left.color == cell.color
        break
      else
        moves.push(move_left)
        move_left = move_left.left
      end
    end

    until move_right.nil?      
      if move_right.contains_piece? && move_right.color != cell.color          
        moves.push(move_right)
        break
      elsif move_right.contains_piece? && move_right.color == cell.color
        break
      else
        moves.push(move_right)
        move_right = move_right.right
      end
    end

    return moves
  end

  def get_knight_moves(cell)
    moves = []
    unless cell.up.nil?
      unless cell.up.up.nil?
        unless cell.up.up.left.nil?
          moves.push(cell.up.up.left)
        end
        unless cell.up.up.right.nil?
          moves.push(cell.up.up.right)
        end
      end
    end

    unless cell.down.nil?
      unless cell.down.down.nil?
        unless cell.down.down.left.nil?
          moves.push(cell.down.down.left)
        end
        unless cell.down.down.right.nil?
          moves.push(cell.down.down.right)
        end
      end
    end

    unless cell.left.nil?
      unless cell.left.left.nil?
        unless cell.left.left.up.nil?
          moves.push(cell.left.left.up)
        end
        unless cell.left.left.down.nil?
          moves.push(cell.left.left.down)
        end
      end
    end

    unless cell.right.nil?
      unless cell.right.right.nil?
        unless cell.right.right.up.nil?
          moves.push(cell.right.right.up)
        end
        unless cell.right.right.down.nil?
          moves.push(cell.right.right.down)
        end
      end
    end

    moves.filter! {|square| !square.contains_piece? || square.color != cell.color}
    return moves
  end

  def get_bishop_moves(cell)
    moves = []
    move_up_left = cell.up_left
    move_up_right = cell.up_right
    move_down_left = cell.down_left
    move_down_right = cell.down_right

    until move_up_left.nil?
      if move_up_left.contains_piece? && move_up_left.color != cell.color          
        moves.push(move_up_left)
        break
      elsif move_up_left.contains_piece? && move_up_left.color == cell.color
        break
      else
        moves.push(move_up_left)
        move_up_left = move_up_left.up_left
      end
    end

    until move_up_right.nil?
      if move_up_right.contains_piece? && move_up_right.color != cell.color          
        moves.push(move_up_right)
        break
      elsif move_up_right.contains_piece? && move_up_right.color == cell.color
        break
      else
        moves.push(move_up_right)
        move_up_right = move_up_right.up_right
      end
    end

    until move_down_left.nil?
      if move_down_left.contains_piece? && move_down_left.color != cell.color          
        moves.push(move_down_left)
        break
      elsif move_down_left.contains_piece? && move_down_left.color == cell.color
        break
      else
        moves.push(move_down_left)
        move_down_left = move_down_left.down_left
      end
    end

    until move_down_right.nil?
      if move_down_right.contains_piece? && move_down_right.color != cell.color          
        moves.push(move_down_right)
        break
      elsif move_down_right.contains_piece? && move_down_right.color == cell.color
        break
      else
        moves.push(move_down_right)
        move_down_right = move_down_right.down_right
      end
    end

    return moves
  end

  def get_queen_moves(cell)
    moves = []
    moves.push(get_rook_moves(cell), get_bishop_moves(cell))
    return moves.flatten!(1)
  end

  def get_king_moves(cell)
    moves = []
    unless cell.up.nil?
      unless cell.up.color == cell.color
        moves.push(cell.up)
      end
    end
    unless cell.down.nil?
      unless cell.down.color == cell.color
        moves.push(cell.down)
      end
    end
    unless cell.left.nil?
      unless cell.left.color == cell.color
        moves.push(cell.left)
      end
    end
    unless cell.right.nil?
      unless cell.right.color == cell.color
        moves.push(cell.right)
      end
    end
    unless cell.up_left.nil?
      unless cell.up_left.color == cell.color
        moves.push(cell.up_left)
      end
    end
    unless cell.up_right.nil?
      unless cell.up_right.color == cell.color
        moves.push(cell.up_right)
      end
    end
    unless cell.down_left.nil?
      unless cell.down_left.color == cell.color
        moves.push(cell.down_left)
      end
    end
    unless cell.down_right.nil?
      unless cell.down_right.color == cell.color
        moves.push(cell.down_right)
      end
    end
    return moves
  end

end