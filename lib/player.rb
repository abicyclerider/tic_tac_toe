# frozen_string_literal: true

require_relative 'mixins/check_subset'
# Player class represents a player in a game of tic-tac-toe
class Player
  include CheckSubset

  POSITIONS = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
  WINNING_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [7, 5, 3]
  ].freeze

  attr_reader :positions, :symbol

  def initialize(symbol)
    @symbol = symbol
    @positions = []
  end

  def check_winner?
    winner = any_subset_in_list?(@positions, WINNING_COMBINATIONS)
    return unless winner

    puts "Player #{@symbol} wins!!"
    winner
  end

  def check_tie?(other_player)
    tie = (@positions + other_player.positions).length == POSITIONS.length
    return unless tie

    puts "It's a tie!"
    tie
  end

  def take_turn?(board, other_player)
    user_choice = 0
    available_positions = POSITIONS - other_player.positions - @positions

    until available_positions.include?(user_choice)
      puts "#{@symbol} enter an available number 1-9 on the board"
      user_choice = gets.chomp.to_i
    end
    @positions.push(user_choice)
    board.display(self, other_player)
    check_winner? || check_tie?(other_player)
  end
end
