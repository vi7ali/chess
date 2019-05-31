class Queen
  attr_reader :color, :name
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = "queen"
    @color = color
    @symb = nil
    @starting_coords = nil
    post_init
  end

  def moves(current_pos)
    moves = []
    moves += up_moves(current_pos)
    moves += right_moves(current_pos)
    moves += left_moves(current_pos)
    moves += down_moves(current_pos)
    moves += up_left_moves(current_pos)
    moves += up_right_moves(current_pos)
    moves += down_left_moves(current_pos)
    moves += down_right_moves(current_pos)
    return moves
  end

  private

  def post_init
    if color == "white"
      self.symb = "\u2655"
      self.starting_coords = [[7, 3]]
    else
      self.symb = "\u265B"
      self.starting_coords = [[0, 3]]
    end
  end

  def up_moves(current_pos)
    moves = []
    move_up = current_pos.up
    until move_up.nil?      
      if move_up.contains_piece? && move_up.color != current_pos.color          
        moves.push(move_up)
        break
      elsif move_up.contains_piece? && move_up.color == current_pos.color
        break
      else
        moves.push(move_up)
        move_up = move_up.up
      end
    end
    return moves
  end

  def down_moves(current_pos)
    moves = []
    move_down = current_pos.down
    until move_down.nil?      
      if move_down.contains_piece? && move_down.color != current_pos.color          
        moves.push(move_down)
        break
      elsif move_down.contains_piece? && move_down.color == current_pos.color
        break
      else
        moves.push(move_down)
        move_down = move_down.down
      end
    end
    return moves
  end

  def left_moves(current_pos)
    moves = []
    move_left = current_pos.left
    until move_left.nil?      
      if move_left.contains_piece? && move_left.color != current_pos.color          
        moves.push(move_left)
        break
      elsif move_left.contains_piece? && move_left.color == current_pos.color
        break
      else
        moves.push(move_left)
        move_left = move_left.left
      end
    end
    return moves
  end

  def right_moves(current_pos)
    moves = []
    move_right = current_pos.right
    until move_right.nil?      
      if move_right.contains_piece? && move_right.color != current_pos.color          
        moves.push(move_right)
        break
      elsif move_right.contains_piece? && move_right.color == current_pos.color
        break
      else
        moves.push(move_right)
        move_right = move_right.right
      end
    end
    return moves
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