require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board)
    @directions = [:lines]
    super
  end

  def moves
    SlidingPiece.moves(@pos, @directions, @board)
  end

  def symbol
    :R
  end
end
