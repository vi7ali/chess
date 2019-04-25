#lib/board.rb
require 'colorize'

class Board
  LINES = 8
  attr_accessor :board

  def initialize
    @board = generate_board
  end

  def generate_board
    grid = []
    LINES.times do
      row = []
      LINES.times do
        row.push("\u2656 ")
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
          formatted_square = board[row][square].colorize(:color => :black, :background => :light_white)
        else
          formatted_square = board[row][square].colorize(:color => :black, :background => :white)
        end
        line.concat(formatted_square)
      end
      puts line
    end
  end

end

b = Board.new
b.display_board