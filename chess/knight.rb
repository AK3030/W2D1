require_relative "stepping_piece.rb"
require_relative "piece.rb"

class Knight < Piece
  include SteppingPiece

  def initialize(pos, board)
    @directions = [:knight]
    super
  end

  def moves
    SteppingPiece.moves(@pos, @directions, @board)
  end

  def symbol
    :H
  end
end
