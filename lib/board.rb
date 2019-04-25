#lib/board.rb
require 'colorize'

class Board
  LINES = 8
  attr_accessor :board
  attr_reader :board_letters, :board_numbers

  def initialize
    @board = generate_board
    @board_letters = "  A B C D E F G H"
    @board_numbers = %w(8 7 6 5 4 3 2 1)
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
    puts board_letters    

    (0..board.length-1).each do |row|
      line = ""
      switch = row % 2 == 0 ? 0 : 1
      (0..board[row].length-1).each do |square|
        if square % 2 == (0+switch)
          formatted_square = board[row][square].colorize(:color => :black, :background => :light_white)
        else
          formatted_square = board[row][square].colorize(:color => :black, :background => :white)
        end
        line.concat(formatted_square)        
      end
      line = board_numbers[row] + " " + line + " " + board_numbers[row]
      puts line
    end

    puts board_letters
  end

end

b = Board.new
b.display_board