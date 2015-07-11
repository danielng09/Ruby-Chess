class Rook < Piece
  include Slideable

  def valid_moves
    super
  end

  def display
    case @color
    when :black
      "\u265C"
    when :white
      "\u2656"
    end
  end

  def moves
    list = []
    horizontal_dirs.each { |delta| list += explore(delta) }
    list.uniq
  end

end
#
