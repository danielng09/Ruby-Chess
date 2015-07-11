require 'pry'

class HumanPlayer
  attr_accessor :color, :board, :name

  KEYS = {
    "w" => [-1, 0],
    "a" => [0, -1],
    "s" => [1, 0],
    "d" => [0, 1],
    "\r" => [0,0],
  }

  def initialize(name)
    @name = name
  end

  def play_turn
    begin
      puts "enter 'q' to quit the game".colorize(:red)
      puts "Use W-A-S-D keys to navigate the board. Press enter key to select a piece."
      select_start
      # @board.move(starting_position, ending_position)
    # valid_ending = @board.pieces(color).any? { |piece| piece.pos == starting_position }
    # rescue
    #   puts "Retry with a valid move."
    #   retry
    end
  end

  def select_start
    selected_tile = (color == :white ? [1, 3] : [6, 3])
    board.grid[selected_tile[0]][selected_tile[1]].colorize(:red)
    input = $stdin.getch.downcase
    until input == "\r"
      case input
      when "q"
        exit
      when /[wasd]/
        selected_tile.map!.with_index { |coord, index| coord + KEYS[input][index] }
      when "\r"

      end
    end
  end

end
