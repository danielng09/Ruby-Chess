class Bishop < Piece
  include Slideable

  def valid_moves
    super
  end

  def display
    case @color
    when :black
      "\u265D"
    when :white
      "\u2657"
    end
  end

  def moves
    list = []
    diagonal_dirs.each { |delta| list += explore(delta) }
    list.uniq
  end

end
