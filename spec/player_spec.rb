#spec/player_spec.rb
require './lib/player'

describe Player do
  describe "#generate_color" do
    it "generates different colors for each player" do
      p1 = Player.new("Bob")
      p2 = Player.new("Dan")
      expect(p1.color).not_to eql(p2.color)
    end
  end

end