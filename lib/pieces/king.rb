class King
  attr_reader :color, :name
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = "king"
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
      self.symb = "\u2654"
      self.starting_coords = [[7, 4]]  
    else
      self.symb = "\u265A"
      self.starting_coords = [[0, 4]]
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