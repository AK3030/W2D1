require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board)
    @directions = [:diags, :lines]
    super
  end

  def moves
    SlidingPiece.moves(@pos, @directions, @board)
  end

  def symbol
    :Q
  end
end
