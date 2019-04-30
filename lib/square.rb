#lib/square.rb

class Square  
  attr_accessor :coord, :last, :pieces, :content

  def initialize(last, pieces)
    @pieces = pieces
    @last = last
    @coord = generate_coord    
    @content = get_content
  end

  def generate_coord
    coord = []
    if last.nil?
      coord = [0, 0]
    else      
      if last.coord[1] < 7
        coord = [last.coord[0], last.coord[1] + 1]
      else
        coord = [last.coord[0] + 1, 0]
      end
    end
    return coord
  end

  def get_content
    pieces.each do |piece|
      return piece.symb if piece.coord == coord
    end
      return " "
  end

  def to_s    
    puts "Square #{coord} contains the piece #{content}"    
  end
end

