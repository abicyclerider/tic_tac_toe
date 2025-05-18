class Player
  attr_reader :positions, :symbol
  def initialize(symbol)
    @symbol = symbol
    @positions = []
  end

  def take_turn(available_positions)
    user_choice = 0
    until available_positions.include?(user_choice)
      puts "#{@symbol} enter an available number 1-9 on the board"
      user_choice = gets.chomp.to_i
    end
    @positions.push(user_choice)
  end
end
