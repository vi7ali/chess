require './lib/board'

describe Board do
  describe "#generate_board" do
    it "generates the 8x8 grid" do
      b = Board.new
      expect(b.board.length * b.board[rand(8)].length).to eql(64)
    end
  end
  
end