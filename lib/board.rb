#lib/board.rb

require 'colorize'
#require_relative 'cells'

class Board  
  attr_accessor :grid
  attr_reader :board_letters, :board_numbers

  def initialize(grid=nil)
    @grid = grid
    @board_letters = "  A B C D E F G H   ".colorize(:color => :black, :background => :cyan)
    @board_numbers = %w(8 7 6 5 4 3 2 1)    
  end

  def update(grid)
    self.grid = grid
  end

  def display_board
    puts board_letters
    (0..grid.length-1).each do |row|
      line = ""
      switch = row % 2 == 0 ? 0 : 1
      (0..grid[row].length-1).each do |square|
        cell = grid[row][square].to_s
        if square % 2 == (0+switch)
          formatted_square = cell.colorize(:color => :black, :background => :light_white)
        else
          formatted_square = cell.colorize(:color => :black, :background => :white)
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