module InitConfig
  extend self

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