class King
  attr_reader :color, :name, :starting_coords
  attr_accessor :symb

  def initialize(color)
    @name = "king"
    @color = color
    @symb = get_symb
    @starting_coords = [[7, 4], [0, 4]]    
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

  def get_symb
    if color == "white"
      self.symb = "\u2654"
    else
      self.symb = "\u265A"
    end
  end

  def up_moves(current_pos)
    moves = []
    unless current_pos.up.nil?
      unless current_pos.up.color == current_pos.color
        moves.push(current_pos.up)
      end
    end
    return moves
  end

  def down_moves(current_pos)
    moves = []
    unless current_pos.down.nil?
      unless current_pos.down.color == current_pos.color
        moves.push(current_pos.down)
      end
    end
    return moves
  end

  def left_moves(current_pos)
    moves = []
    unless current_pos.left.nil?
      unless current_pos.left.color == current_pos.color
        moves.push(current_pos.left)
      end
    end
    return moves
  end

  def right_moves(current_pos)
    moves = []
    unless current_pos.right.nil?
      unless current_pos.right.color == current_pos.color
        moves.push(current_pos.right)
      end
    end
    return moves
  end

  def up_left_moves(current_pos)
    moves = []
    unless current_pos.up_left.nil?
      unless current_pos.up_left.color == current_pos.color
        moves.push(current_pos.up_left)
      end
    end
    return moves
  end

  def up_right_moves(current_pos)
    moves = []
    unless current_pos.up_right.nil?
      unless current_pos.up_right.color == current_pos.color
        moves.push(current_pos.up_right)
      end
    end
    return moves
  end

  def down_left_moves(current_pos)
    moves = []
    unless current_pos.down_left.nil?
      unless current_pos.down_left.color == current_pos.color
        moves.push(current_pos.down_left)
      end
    end
    return moves
  end

  def down_right_moves(current_pos)
    moves = []
    unless current_pos.down_right.nil?
      unless current_pos.down_right.color == current_pos.color
        moves.push(current_pos.down_right)
      end
    end
    return moves
  end
  
end