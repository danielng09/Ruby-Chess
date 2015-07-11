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
      @board.display_board
      current_player = (turn % 2 == 0 ? @player1 : @player2)
      current_player.play_turn
      turn += 1
    end

    @board.display_board
    winner = turn.odd? ? @player1.name : @player2.name
    puts "Congrats #{winner}, you won in #{turn/2} rounds!"
  end
end



daniel = HumanPlayer.new("Player1")
karen = HumanPlayer.new("Player2")

chess = Game.new(daniel, karen)
chess.play
