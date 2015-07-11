class Queen < Piece
  include Slideable

  def valid_moves
    super
  end

  def display
    case @color
    when :black
      "\u265B"
    when :white
      "\u2655"
    end
  end

  def moves
    list = []
    (horizontal_dirs + diagonal_dirs).each { |delta| list += explore(delta) }
    list.uniq
  end

end
