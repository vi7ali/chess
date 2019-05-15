#Player class. Sets name, sets random color, makes move

class Player
  @@players_total = 0
  @@first_color

  attr_reader :name, :color
  attr_accessor :current_move, :current_piece

  def players_total
    @@players_total
  end

  def players_total=(players_total)
    @@players_total = players_total
  end

  def first_color
    @@first_color
  end

  def first_color=(first_color)
    @@first_color = first_color
  end

  def initialize
    @name = get_name
    @color = generate_color
    @current_piece = nil
    @current_move = nil
    post_init
  end

  def post_init    
    if players_total == 1
      puts "#{name}, the Ancient Gods have decided that you will be commanding the #{color} warriors"
    else
      puts "As for you #{name}, you will control the #{color} army"
    end
    puts ""
    puts "(enter to continue)"
    gets.chomp!
    system('clear')
  end

  def get_name
    system('clear')
    puts "Player #{players_total+1}, please enter your name"
    name = gets.chomp!
    system('clear')    
    return name
  end

  def generate_color
    if players_total == 0
      self.players_total = players_total + 1
      self.first_color = rand(2) == 0 ? "white" : "black"          
    else      
      self.players_total = players_total + 1
      second_color = first_color == "white" ? "black" : "white"
    end
  end

  def get_piece
    puts "Select your piece"
    self.current_piece = gets.chomp!
  end

  def get_move
    puts "Select a square"
    self.current_move = gets.chomp!
  end
end