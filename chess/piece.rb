class Piece
  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def valid_moves
  end

  def symbol
    self.to_s
  end

  def move_into_check(to_pos)
    @pos = to_pos
  end

  def to_s
    "@"
  end
end

class NullPiece < Piece
  def initialize
  end

  def to_s
    "#"
  end
end
