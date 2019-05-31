class Bishop
  attr_reader :color, :name, :starting_coords
  attr_accessor :symb

  def initialize(color)
    @name = "bishop"
    @color = color
    @symb = get_symb    
    @starting_coords = [[7, 2], [0, 2], [0, 5], [7, 5]]
  end

  def moves(current_pos)
    moves = []
    moves += up_left_moves(current_pos)
    moves += up_right_moves(current_pos)
    moves += down_left_moves(current_pos)
    moves += down_right_moves(current_pos)
    return moves
  end

  private

  def get_symb
    if color == "white"
      self.symb = "\u2657"   
    else
      self.symb = "\u265D"
    end
  end

  def up_left_moves(current_pos)
    moves = []
    move_up_left = current_pos.up_left
    until move_up_left.nil?
      if move_up_left.contains_piece? && move_up_left.color != current_pos.color          
        moves.push(move_up_left)
        break
      elsif move_up_left.contains_piece? && move_up_left.color == current_pos.color
        break
      else
        moves.push(move_up_left)
        move_up_left = move_up_left.up_left
      end
    end
    return moves
  end

  def up_right_moves(current_pos)
    moves = []
    move_up_right = current_pos.up_right
    until move_up_right.nil?
      if move_up_right.contains_piece? && move_up_right.color != current_pos.color          
        moves.push(move_up_right)
        break
      elsif move_up_right.contains_piece? && move_up_right.color == current_pos.color
        break
      else
        moves.push(move_up_right)
        move_up_right = move_up_right.up_right
      end
    end
    return moves
  end

  def down_left_moves(current_pos)
    moves = []
    move_down_left = current_pos.down_left
    until move_down_left.nil?
      if move_down_left.contains_piece? && move_down_left.color != current_pos.color          
        moves.push(move_down_left)
        break
      elsif move_down_left.contains_piece? && move_down_left.color == current_pos.color
        break
      else
        moves.push(move_down_left)
        move_down_left = move_down_left.down_left
      end
    end
    return moves
  end

  def down_right_moves(current_pos)
    moves = []
    move_down_right = current_pos.down_right
    until move_down_right.nil?
      if move_down_right.contains_piece? && move_down_right.color != current_pos.color          
        moves.push(move_down_right)
        break
      elsif move_down_right.contains_piece? && move_down_right.color == current_pos.color
        break
      else
        moves.push(move_down_right)
        move_down_right = move_down_right.down_right
      end
    end
    return moves
  end

end