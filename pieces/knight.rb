class Knight < Piece
  include Stepable

  def valid_moves
    super
  end

  def display
    color == :black ? "\u265E" : "\u2658"
  end

  def steppable_dirs
    deltas = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end
end
