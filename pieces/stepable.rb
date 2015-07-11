module Stepable
  def moves
    steppable_dirs.map do |x_dir, y_dir|
      [x_dir + @pos.first, y_dir + @pos.last]
    end.select do |position|
      position.all? { |coordinate| coordinate.between?(0,7) }
    end
  end

  def valid_moves
    moves.reject do |x, y|
      other_piece = @board.grid[x][y]
      if other_piece.nil?
        false
      else
        other_piece.color == self.color
      end
    end
  end
end
