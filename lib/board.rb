#lib/board.rb

require 'colorize'
#require_relative 'cells'

class Board  
  attr_accessor
  attr_reader :board_letters, :board_numbers

  def initialize
    @board_letters = "  A B C D E F G H   ".colorize(:color => :black, :background => :cyan)
    @board_numbers = %w(8 7 6 5 4 3 2 1)    
  end

  def display(cells)
    grid = generate_grid(cells)
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

  def generate_grid(cells)
    grid = []
    row = []    
    cells.each do |cell|
      row.push(cell.content + " ")          #Adding a space for aesthetic purpose
      if row.length == InitConfig::TOTAL_COLUMNS
        grid.push(row)
        row = []        
      end      
    end
    grid
  end

  def color_line(line, row)
    colored_number_left = (board_numbers[row] + " ").colorize(:color => :black, :background => :cyan)
    colored_number_right = (" " + board_numbers[row]).colorize(:color => :black, :background => :cyan)
    line = colored_number_left + line + colored_number_right
  end
end