class Knight
  attr_reader :color, :name, :starting_coords
  attr_accessor :symb

  def initialize(color)
    @name = "knight"
    @color = color
    @symb = get_symb
    @starting_coords = [[7, 1], [0, 1], [0, 6], [7, 6]]
    
  end

  def moves(current_pos)
    moves = []
    moves += two_up_moves(current_pos)
    moves += two_right_moves(current_pos)
    moves += two_left_moves(current_pos)
    moves += two_down_moves(current_pos)
    return moves
  end

  private

  def get_symb
    if color == "white"
      self.symb = "\u2658"     
    else
      self.symb = "\u265E"
    end
  end

  def two_up_moves(current_pos)
    moves = []
    unless current_pos.up.nil?
      unless current_pos.up.up.nil?
        unless current_pos.up.up.left.nil?
          moves.push(current_pos.up.up.left)
        end
        unless current_pos.up.up.right.nil?
          moves.push(current_pos.up.up.right)
        end
      end
    end
    return moves
  end

  def two_down_moves(current_pos)
    moves = []
    unless current_pos.down.nil?
      unless current_pos.down.down.nil?
        unless current_pos.down.down.left.nil?
          moves.push(current_pos.down.down.left)
        end
        unless current_pos.down.down.right.nil?
          moves.push(current_pos.down.down.right)
        end
      end
    end
    return moves
  end

  def two_left_moves(current_pos)
    moves = []
    unless current_pos.left.nil?
      unless current_pos.left.left.nil?
        unless current_pos.left.left.up.nil?
          moves.push(current_pos.left.left.up)
        end
        unless current_pos.left.left.down.nil?
          moves.push(current_pos.left.left.down)
        end
      end
    end
    return moves
  end

  def two_right_moves(current_pos)
    moves = []
    unless current_pos.right.nil?
      unless current_pos.right.right.nil?
        unless current_pos.right.right.up.nil?
          moves.push(current_pos.right.right.up)
        end
        unless current_pos.right.right.down.nil?
          moves.push(current_pos.right.right.down)
        end
      end
    end
    return moves
  end

end