#lib/game.rb
require_relative 'cells'
require_relative 'board'

class Game
  attr_accessor :cells, :board

  def initialize(args)
    @cells = args[:cells]
    @board = args[:board]
  end

  def update_board
    grid = cells.generate_grid
    board.update(grid)
  end

  def play
    update_board
    board.display_board
  end  
end

g = Game.new(cells: Cells.new, board: Board.new)
g.play