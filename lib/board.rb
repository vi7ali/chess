#lib/board.rb

require 'colorize'
require_relative 'cells'

class Board
  LINES = 8
  attr_accessor :board
  attr_reader :board_letters, :board_numbers

  def initialize
    @board = generate_board
    @board_letters = "  A B C D E F G H   ".colorize(:color => :black, :background => :cyan)
    @board_numbers = %w(8 7 6 5 4 3 2 1)
    #@cells = Cells.new
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
      puts color_line(line, row)
    end
    puts board_letters
  end

  def color_line(line, row)
    colored_number_left = (board_numbers[row] + " ").colorize(:color => :black, :background => :cyan)
    colored_number_right = (" " + board_numbers[row]).colorize(:color => :black, :background => :cyan)
    line = colored_number_left + line + colored_number_right
  end

end

b = Board.new
b.display_board