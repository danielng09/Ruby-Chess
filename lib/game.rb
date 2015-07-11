require_relative 'board'
require_relative 'player'
require 'io/console'
require 'colorize'

class Game
  attr_accessor :board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1.color = :white
    @player2.color = :black
  end

  def play
    @board = Board.new
    @player1.board = @board
    @player2.board = @board

    turn = 0
    until @board.checkmate?(:black) || @board.checkmate?(:white)
      current_player = (turn % 2 == 0 ? @player1 : @player2)
      @board.color = current_player.color
      current_player.play_turn
      turn += 1
    end

    @board.display_board
    winner = turn.odd? ? @player1.color : @player2.color
    puts "Congrats #{winner.to_s.capitalize}!!!".colorize(:magenta)
  end
end



player1 = HumanPlayer.new
player2 = HumanPlayer.new

chess = Game.new(player1, player2)
chess.play
