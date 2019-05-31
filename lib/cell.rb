#lib/cell.rb

class Cell  
  
  attr_accessor :coord, :piece, :content, :moves, :color, :up, :down, :left, 
                :right, :up_left, :up_right, :down_left, :down_right, :name, 
                :en_passant

  def initialize(coord, piece, name)    
    @coord = coord
    @piece = piece
    @moves = []
    @color = get_color
    @content = get_content
    @name = name
    @up = nil
    @down = nil
    @left = nil
    @right = nil
    @up_left = nil
    @up_right = nil
    @down_left = nil
    @down_right = nil
  end

  def contains_piece?
    if piece.nil?
      return false
    else
      return true
    end
  end

  def get_color
    return piece.color if contains_piece?
    return nil
  end

  def get_content
    return piece.symb if contains_piece?
    return " "
  end

  def update_moves
    if contains_piece?
      self.moves = piece.moves(self)
    else
      self.moves = []
    end
  end
  
  def update_cell(pce = nil)
    self.piece = pce
    self.content = get_content
    self.color = get_color
  end

  def show_moves
    moves_string = ""
    moves.each do |cell|
      moves_string = moves_string + cell.name + " "
    end
    puts moves_string.strip!
  end

  def show
    moves_string = ""
    moves.each do |cell|
      moves_string = moves_string + cell.coord.to_s + ", "
    end
    puts "Square #{coord} contains the piece #{content}, color is #{color}, moves are #{moves_string}"    
  end

end

