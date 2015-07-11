require 'pry'

class HumanPlayer
  attr_accessor :color, :board

  KEYS = {
    "w" => [-1, 0],
    "a" => [0, -1],
    "s" => [1, 0],
    "d" => [0, 1],
    "\r" => [0,0],
  }

  def play_turn
    begin
      board.error = "Check!" if board.in_check?(color)
      start = select_start.dup
      last = select_end.dup
      board.move(start, last)
      board.start_cursor = nil
    rescue
      puts "Retry with a valid move."
      retry
    end
  end

  def select_start
    board.cursor = (color == :white ? [6, 3] : [1, 3])
    board.display_board

    valid_selection = false
    until valid_selection
      input = $stdin.getch.downcase
      case input
      when "q"
        exit
      when /[wasd]/
        board.cursor.map!.with_index { |coord, index| coord + KEYS[input][index] }
      when "\r"
        piece = board.grid[board.cursor[0]][board.cursor[1]]
        if piece.nil?
          board.error = "Please select a piece on the board"
        elsif piece.color != color
          board.error = "Select your own piece!"
        elsif piece.valid_moves.count == 0
          board.error = "No valid moves for piece"
        else
          board.error = ""
          valid_selection = true
        end
      end
      board.display_board
    end
    board.start_cursor = board.cursor.dup
    board.cursor
  end

  def select_end
    piece = board.grid[board.cursor[0]][board.cursor[1]]
    board.display_board
    valid_selection = false
    until valid_selection
      input = $stdin.getch.downcase
      case input
      when "q"
        exit
      when /[wasd]/
        board.cursor.map!.with_index { |coord, index| coord + KEYS[input][index] }
      when "\r"
        if piece.valid_moves.include?(board.cursor)
          board.error = ""
          valid_selection = true
        else
          board.error = "Not a valid move!"
        end
      end
      board.display_board
    end
    board.cursor
  end

end
