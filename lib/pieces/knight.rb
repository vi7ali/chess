class Knight
  attr_reader :color, :name
  attr_accessor :symb, :starting_coords

  def initialize(color)
    @name = "knight"
    @color = color
    @symb = nil
    @starting_coords = nil
    post_init
  end

  def moves(current_pos)
    moves = []
    moves += two_up_moves(current_pos)
    moves += two_right_moves(current_pos)
    moves += two_left_moves(current_pos)
    moves += two_down_moves(current_pos)
    moves.filter! {|square| !square.contains_piece? || square.color != current_pos.color}
    return moves
  end

  private

  def post_init
    if color == "white"
      self.symb = "\u2658"
      self.starting_coords = [[7, 1], [7, 6]]
    else
      self.symb = "\u265E"
      self.starting_coords = [[0, 1], [0, 6]]
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