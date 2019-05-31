module InitConfig
  extend self
  
  TOTAL_CELLS = 64
  TOTAL_COLUMNS = 8
  TOTAL_PIECES = 32

  def set_initial_positions
    positions = {}

    #PAWN INITIAL POSITIONS
    pawn_pos = []
    white_row = 1
    black_row = 6
    (0..7).each do |col|
      pawn_pos.push([white_row, col])
      pawn_pos.push([black_row, col])
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

  def get_cell_name(coord)
    row = nil
    col = ""
    name = ""
    8.downto(1).with_index do |num, idx|
      if coord[0] == idx
        row = num
        break
      end
    end
    ("A".."H").each.with_index do |letter, idx|
      if coord[1] == idx
        col = letter
        break
      end
    end
    name = col + row.to_s

    return name
  end

  def set_symbols
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

  def generate_directions(cells)
    cells.all_cells.each do |cell|
      row = cell.coord[0]
      column = cell.coord[1]

      up = cells.get_cell([row - 1, column])
      down = cells.get_cell([row + 1, column])
      left = cells.get_cell([row, column - 1])
      right = cells.get_cell([row, column + 1])
      up_left = cells.get_cell([row - 1, column - 1])
      up_right = cells.get_cell([row - 1, column + 1])
      down_left = cells.get_cell([row + 1, column - 1])
      down_right = cells.get_cell([row + 1, column + 1])

      cell.up = up unless up.nil?
      cell.down = down unless down.nil?
      cell.left = left unless left.nil?
      cell.right = right unless right.nil?
      cell.up_left = up_left unless up_left.nil?
      cell.up_right = up_right unless up_right.nil?
      cell.down_left = down_left unless down_left.nil?
      cell.down_right = down_right unless down_right.nil?
    end
  end
end