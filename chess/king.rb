require_relative "piece.rb"
require_relative "stepping_piece.rb"

class King < Piece
  include SteppingPiece

  def initialize(pos, board)
    @directions = [:king]
    super
  end

  def moves
    SteppingPiece.moves(@pos, @directions, @board)
  end

  def symbol
    :K
  end
end
