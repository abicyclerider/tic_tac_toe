# frozen_string_literal: true

class Board
  POSITION_TO_INDEX = {
    1 => 49, # Bottom left
    2 => 53,  # Bottom middle
    3 => 57,  # Bottom right
    4 => 25,  # Middle left
    5 => 29,  # Center
    6 => 33,  # Middle right
    7 => 1,   # Top left
    8 => 5,   # Top middle
    9 => 9    # Top right
  }.freeze
  def initialize
    @board_text = "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   ".split('')
  end

  def display(player_x, player_o)
    player_x.positions.each do |element|
      @board_text[POSITION_TO_INDEX[element]] = player_x.symbol
    end
    player_o.positions.each do |element|
      @board_text[POSITION_TO_INDEX[element]] = player_o.symbol
    end

    puts @board_text.join
  end
end
