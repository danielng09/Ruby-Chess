class King < Piece
  include Stepable

  def valid_moves
    super
  end

  def display
    case @color
    when :black
      "\u265A"
    when :white
      "\u2654"
    end
  end

  def steppable_dirs
    [[0,1],[1,0],[-1,0],[0,-1],[1,1],[-1,-1],[-1,1],[1,-1]]
  end
end
