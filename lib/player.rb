# frozen_string_literal: true

require_relative 'mixins/chech_subset'

class Player
  include CheckSubset

  WINNING_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 6],
    [3, 6, 9],
    [1, 5, 9],
    [7, 5, 3]
  ].freeze

  attr_reader :positions, :symbol

  def initialize(symbol)
    @symbol = symbol
    @positions = []
  end

  def check_winner
    check_subsets?(@positions, WINNING_COMBINATIONS)
  end

  def take_turn(available_positions)
    user_choice = 0
    until available_positions.include?(user_choice)
      puts "#{@symbol} enter an available number 1-9 on the board"
      user_choice = gets.chomp.to_i
    end
    @positions.push(user_choice)
    check_winner
  end
end
