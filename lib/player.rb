# frozen_string_literal: true

# Player class. Sets name, sets random color
class Player
  @players_total = 0
  @first_color = nil
  class << self
    attr_accessor :players_total, :first_color
  end

  attr_reader :name, :color
  def initialize
    @name = input_name
    @color = generate_color
    post_init
  end

  private

  def post_init
    if Player.players_total == 1
      puts "#{name}, you will be commanding the #{color} warriors"
    else
      puts "As for you #{name}, you will control the #{color} army"
    end
    puts ''
    puts '(enter to continue)'
    gets.chomp!
    system('clear')
  end

  def input_name
    system('clear')
    puts "Player #{Player.players_total + 1}, please enter your name"
    name = gets.chomp!
    system('clear')
    name
  end

  def generate_color
    if Player.players_total.zero?
      Player.first_color = rand(2).zero? ? 'white' : 'black'
      color = Player.first_color
    else
      color = Player.first_color == 'white' ? 'black' : 'white'
    end
    Player.players_total = Player.players_total + 1
    color
  end
end
