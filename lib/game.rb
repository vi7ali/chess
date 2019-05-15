#lib/game.rb

require_relative 'cells'
require_relative 'pieces'
require_relative 'board'
require_relative 'player'
require_relative 'logic'

class Game
  @@moves_total = 0

  def moves_total
    @@moves_total
  end

  def moves_total=(moves_total)
    @@moves_total = moves_total
  end

  attr_accessor :cells, :board, :pieces, :current_player, :player_1, :player_2, :pieces, :logic

  def initialize(args)
    @player_1 = args[:player_1]
    @player_2 = args[:player_2]
    @pieces = args[:pieces]
    @board = args[:board]
    @cells = Cells.new(pieces.all_pieces)
    @logic = Logic.new(cells, pieces)
    @current_player = get_current_player
  end

  def update_board
    board.display(cells.all_cells)
  end

  def play
    update_board
    until logic.end_game?(current_player)
      cell = logic.select_cell(current_player)
      move = logic.select_move(cell)
      until logic.valid_move?(cell, move)
        puts "Invalid move. This piece can't move like that or this move might result in check"
        cell = logic.select_cell(current_player)
        move = logic.select_move(cell)
      end
      cells.update_cells(cell, move)
      system("clear")
      update_board
      self.moves_total += 1
      self.current_player = get_current_player
    end    
  end

  def get_current_player
    white_player = player_1.color == "white" ? player_1 : player_2
    black_player = player_1.color == "black" ? player_1 : player_2    
    if moves_total % 2 == 0
      return white_player
    else
      return black_player
    end
  end 
end

g = Game.new( pieces: Pieces.new,              
              board: Board.new, 
              player_1: Player.new, 
              player_2: Player.new)
g.play