# frozen_string_literal: true

require_relative 'cells'
require_relative 'pieces'
require_relative 'board'
require_relative 'player'
require_relative 'logic'

# lib/game.rb
# Main game loop
class Game
  @moves_total = 0

  class << self
    attr_accessor :moves_total
  end

  attr_reader :cells, :board, :player1, :player2, :pieces, :logic
  attr_accessor :current_player

  def initialize(args)
    @player1 = args[:player1]
    @player2 = args[:player2]
    @pieces = args[:pieces].all_pieces
    @board = args[:board]
    @cells = Cells.new(pieces)
    @logic = Logic.new(cells)
    @current_player = select_current_player
  end

  def play
    update_board
    until logic.end_game?(current_player)
      make_move(current_player)
      system('clear')
      update_board
      self.current_player = select_current_player
    end
  end

  private

  def make_move(current_player)
    cell = logic.select_cell(current_player)
    move = logic.select_move(cell)
    until logic.valid_move?(cell, move)
      puts "This piece can't move like that or the move might result in check"
      cell = logic.select_cell(current_player)
      move = logic.select_move(cell)
    end
    cells.update_cells(cell, move)
    Game.moves_total += 1
  end

  def update_board
    show_banner
    board.display(cells.all_cells)
  end

  def show_banner
    banner = <<~BNR
        ______  __    __   _______     _______.   _______.
       /      ||  |  |  | |   ____|   /       |  /       |
      |  ,----'|  |__|  | |  |__     |   (----` |   (----`
      |  |     |   __   | |   __|     \\   \\      \\   \\
      |  `----.|  |  |  | |  |____.----)   | .----)   |
       \\______||__|  |__| |_______|_______/  |_______/
                     by Vitaly Osipov

    BNR
    puts banner
  end

  def select_current_player
    white_player = player1.color == 'white' ? player1 : player2
    black_player = player1.color == 'black' ? player1 : player2
    return white_player if Game.moves_total.even?

    black_player
  end
end
