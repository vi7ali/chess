#Player class. Sets name, sets random color, makes move

class Player
  @@players_total = 0
  @@first_color

  attr_reader :name, :color

  def initialize(name)
    @name = name
    @color = generate_color      
  end  

  def generate_color
    if @@players_total == 0
      @@players_total += 1
      @@first_color = rand(2) == 0 ? "white" : "black"          
    else
      second_color = @@first_color == "white" ? "black" : "white"
    end
  end
end