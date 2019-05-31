class Rook
  attr_reader :color, :name
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = "rook"
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
    return moves
  end

  private

  def post_init
    if color == "white"
      self.symb = "\u2656"
      self.starting_coords = [[7, 0], [7, 7]]
    else
      self.symb = "\u265C"
      self.starting_coords = [[0, 0], [0, 7]]
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

end