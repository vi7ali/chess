# frozen_string_literal: true

require 'colorize'
# lib/board.rb
# Board class represents a board in chess
# and responds to the public interface 'display' that# 
# prints the board row by row using a collection of cells
# passed as an argument
class Board
  attr_accessor :backg_color
  attr_reader :board_letters, :board_numbers

  def initialize
    @board_letters = '  A B C D E F G H   '.colorize(color: :black,
                                                     background: :cyan)
    @board_numbers = %w[8 7 6 5 4 3 2 1]
    @backg_color = :light_white
  end

  def display(cells)
    grid = generate_grid(cells)
    puts board_letters
    grid.each_with_index do |row, idx|
      line = create_line(row)
      puts format_line(line, idx)
      switch_color
    end
    puts board_letters
  end

  private

  def create_line(row)
    line = ''.dup
    row.each do |square|
      square = square.to_s
      colorized_square = square.colorize(color: :black,
                                         background: backg_color)
      line.concat(colorized_square)
      switch_color
    end
    line
  end

  def switch_color
    self.backg_color = backg_color == :white ? :light_white : :white
  end

  def generate_grid(cells)
    grid = []
    row = []
    cells.each do |cell|
      row.push(cell.content + ' ')
      if row.length == 8
        grid.push(row)
        row = []
      end
    end
    grid
  end

  def format_line(line, idx)
    colored_number_left = (board_numbers[idx] + ' ').colorize(color: :black,
                                                              background: :cyan)
    colored_number_right = (' ' + board_numbers[idx]).colorize(color: :black,
                                                               background: :cyan)
    line = colored_number_left + line + colored_number_right
    line
  end
end
