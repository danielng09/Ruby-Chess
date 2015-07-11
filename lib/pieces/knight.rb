class Knight < Piece
  include Stepable

  def valid_moves
    super
  end

  def display
    case @color
    when :black
      "\u265E"
    when :white
      "\u2658"
    end
  end
  #call moves(horizontal)

  def moves
    deltas = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    super(deltas)
  end

end
