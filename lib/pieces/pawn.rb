class Pawn
  attr_reader :color, :name
  attr_accessor :symb, :starting_row, :starting_coords

  def initialize(color)
    @name = "pawn"
    @color = color
    @symb = nil
    @starting_row = nil
    @starting_coords = generate_coords
    post_init
  end

  def moves(current_pos)
    moves = []
    if color == "white"
      return get_white_moves(current_pos)
    else
      return get_black_moves(current_pos)
    end
    return moves
  end

  private

  def post_init
    if color == "white"
      self.symb = "\u2659"
      self.starting_row = 6
    else
      self.symb = "\u265F"
      self.starting_row = 1
    end
  end
  
  def generate_coords
    starting_coords = []
    white_row = 1
    black_row = 6
    (0..7).each do |col|
      starting_coords.push([white_row, col])
      starting_coords.push([black_row, col])
    end
    return starting_coords
  end

  def get_white_moves(current_pos)
    moves = []
    current_row = current_pos.coord[0]
    #Vertical moves
    unless current_pos.up.nil?      
      unless current_pos.up.contains_piece?
        moves.push(current_pos.up)
        #first move
        if current_row == starting_row && !current_pos.up.up.contains_piece?
          moves.push(current_pos.up.up)
        end
      end
    end
    #Diagonal moves
    unless current_pos.up_left.nil?
      if current_pos.up_left.contains_piece? && current_pos.up_left.color != current_pos.color
        moves.push(current_pos.up_left)
      end
    end
    unless current_pos.up_right.nil?
      if current_pos.up_right.contains_piece? && current_pos.up_right.color != current_pos.color
        moves.push(current_pos.up_right)
      end
    end
    return moves
  end

  def get_black_moves(current_pos)
    moves = []
    current_row = current_pos.coord[0]
    #Vertical moves
    unless current_pos.down.nil?      
      unless current_pos.down.contains_piece?
        moves.push(current_pos.down)
        #First move
        if current_row == starting_row && !current_pos.down.down.contains_piece?
          moves.push(current_pos.down.down)
        end
      end
    end
    #Diagonal moves
    unless current_pos.down_left.nil?
      if current_pos.down_left.contains_piece? && current_pos.down_left.color != current_pos.color
        moves.push(current_pos.down_left)
      end
    end    
    unless current_pos.down_right.nil?
      if current_pos.down_right.contains_piece? && current_pos.down_right.color != current_pos.color
        moves.push(current_pos.down_right)
      end
    end
    return moves
  end

end