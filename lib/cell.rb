# frozen_string_literal: true

# lib/cell.rb
class Cell
  attr_accessor :coord, :piece, :content, :moves, :color, :up, :down, :left,
                :right, :up_left, :up_right, :down_left, :down_right, :name

  def initialize(coord, piece)
    @coord = coord
    @piece = piece
    @moves = []
    @color = update_color
    @content = update_content
    @name = cell_name
    @up = nil
    @down = nil
    @left = nil
    @right = nil
    @up_left = nil
    @up_right = nil
    @down_left = nil
    @down_right = nil
  end

  def directions(cells)
    row = coord[0]
    col = coord[1]
    self.up = cells.get_cell([row - 1, col])
    self.down = cells.get_cell([row + 1, col])
    self.left = cells.get_cell([row, col - 1])
    self.right = cells.get_cell([row, col + 1])
    self.up_left = cells.get_cell([row - 1, col - 1])
    self.up_right = cells.get_cell([row - 1, col + 1])
    self.down_left = cells.get_cell([row + 1, col - 1])
    self.down_right = cells.get_cell([row + 1, col + 1])
  end

  def update_moves
    self.moves = []
    self.moves = piece.moves(self) if contains_piece?
  end

  def update_cell(pce = nil)
    self.piece = pce
    self.content = update_content
    self.color = update_color
  end

  def contains_piece?
    return false if piece.nil?

    true
  end

  private

  def cell_name
    row = coord[0]
    col = coord[1]
    name = col_letter(col) + row_number(row)
    name
  end

  def row_number(row)
    8.downto(1).with_index do |num, idx|
      return num.to_s if row == idx
    end
  end

  def col_letter(col)
    ('A'..'H').each.with_index do |letter, idx|
      return letter if col == idx
    end
  end

  def update_color
    return piece.color if contains_piece?

    nil
  end

  def update_content
    return piece.symb if contains_piece?

    ' '
  end
end
