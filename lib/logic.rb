module Logic
  
  TOTAL_SQUARES = 64
  TOTAL_COLUMNS = 8
  TOTAL_PIECES = 32

  def Logic.get_initial_positions
    positions = {}

    #PAWN INITIAL POSITIONS
    pawn_pos = []
    white = 1
    black = 6
    (0..7).each do |col|
      pawn_pos.push([white, col])
      pawn_pos.push([black, col])
    end
    
    #PAWN
    positions[:pawn] = pawn_pos
    #ROOK
    positions[:rook] = [[7, 0], [0, 0], [0, 7], [7, 7]]
    #KNIGHT
    positions[:knight] = [[7, 1], [0, 1], [0, 6], [7, 6]]
    #BISHOP
    positions[:bishop] = [[7, 2], [0, 2], [0, 5], [7, 5]]
    #QUEEN
    positions[:queen] = [[7, 3], [0, 3]]
    #KING
    positions[:king] = [[7, 4], [0, 4]]

    positions
  end

  def Logic.get_symbols
    white_symbols = { 
      pawn: "\u2659", 
      knight: "\u2658",
      bishop: "\u2657",
      rook: "\u2656",
      queen: "\u2655",
      king: "\u2654" 
    }
    
    black_symbols = {
      pawn: "\u265F", 
      knight: "\u265E",
      bishop: "\u265D",
      rook: "\u265C",
      queen: "\u265B",
      king: "\u265A" 
    }

    all_symbols = { white: white_symbols, black: black_symbols }
  end


end