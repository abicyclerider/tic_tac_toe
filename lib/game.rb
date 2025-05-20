# frozen_string_literal: true

require_relative './player'
require_relative './board'

# Game class represents a gameof tic-tac-toe
class Game
  def initialize
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = Board.new
  end

  def play_round
    loop do
      if @player_x.take_turn?(@board, @player_o)
        @board.display(@player_x, @player_o)
        break
      elsif @player_o.take_turn?(@board, @player_x)
        @board.display(@player_x, @player_o)
        break
      end
    end
  end
end
