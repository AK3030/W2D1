require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board)
    @directions = [:diags]
    super
  end

  def moves
    SlidingPiece.moves(@pos, @directions, @board)
  end

  def symbol
    :♗
  end
end
