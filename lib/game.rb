# frozen_string_literal: true

require_relative './player'
require_relative './board'

class Game
  POSITIONS = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

  def initialize
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = Board.new
  end

  def play_round
    loop do
      if @player_x.take_turn(POSITIONS - @player_x.positions - @player_o.positions)
        puts "Player #{@player_x.symbol} wins!!"
        @board.display(@player_x, @player_o)
        break
      else
        @board.display(@player_x, @player_o)
      end

      if @player_o.take_turn(POSITIONS - @player_x.positions - @player_o.positions)
        puts "Player #{@player_o.symbol} wins!!"
        @board.display(@player_x, @player_o)
        break
      else
        @board.display(@player_x, @player_o)
      end
    end
  end
end
