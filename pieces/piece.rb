class Piece
  attr_accessor :pos, :moved
  attr_reader :color

  def initialize(color, pos, moved, board)
    @color = color
    @pos = pos
    @moved = moved
    @board = board
  end

  def move_into_check?(ending_position)
    duplicated_board = @board.deep_dup
    duplicated_board.move!(self.pos, ending_position)
    duplicated_board.in_check?(self.color)
  end

  def on_board?(pos)
    pos.all? { |coordinate| coordinate.between?(0, 7) }
  end

  def moves(deltas)
    deltas.map do |x_dir, y_dir|
      [x_dir + @pos.first, y_dir + @pos.last]
    end.select do |position|
      position.all? { |coordinate| coordinate.between?(0,7) }
    end
  end

  def moved?
    @moved
  end

end
