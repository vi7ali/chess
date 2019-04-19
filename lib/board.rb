#lib/board.rb

class Board
  LINES = 8
  attr_accessor :board
  attr_reader :black_bg, :white_bg, :end_color

  def initialize
    @board = generate_board
    @black_bg = "\e[1;30;49m"
    @white_bg = "\e[1;30;107m"
    @end_color = "\e[0m"
  end

  def generate_board
    grid = []
    LINES.times do
      row = []
      LINES.times do
        row.push("♜ ")
      end
      grid.push(row)
    end
    return grid
  end

  def display_board
    (0..board.length-1).each do |row|
      line = ""
      check = row % 2 == 0 ? 0 : 1
      (0..board[row].length-1).each do |square|
        if square % 2 == (0+check)
          formatted_square = white_bg + board[row][square] + end_color
        else
          formatted_square = black_bg + board[row][square] + end_color
        end
        line.concat(formatted_square)
      end
      puts line
    end
  end

end

b = Board.new
b.display_board