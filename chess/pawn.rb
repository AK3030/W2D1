require_relative "piece.rb"

class Pawn < Piece
  def initialize(pos, board)
    super
  end

  def dir
    @dir = 0
    if @color == :W
      @dir = -1
    else
      @dir = 1
    end
    @dir
  end

  def take_piece
    pos = []
    pos1 = [@pos.first+dir, @pos.last + 1]
    pos2 = [@pos.first+dir, @pos.last - 1]
    diag1 = @board[pos1]
    diag2 = @board[pos2]

    if @board.in_bounds(pos1)
      pos << pos1 if diag1.color && (diag1.color != @color)
    end

    if @board.in_bounds(pos2)
      pos << pos2 if diag2.color && (diag2.color != @color)
    end

    pos
  end

  def vert_moves
    pos = []
    pos1 = [@pos.first+dir, @pos.last]
    pos2 = [@pos.first+ 2*dir, @pos.last]
    move1 = @board[pos1]
    move2 = @board[pos2]

    pos << pos1 if move1.class == (NullPiece)
    pos << pos2 if move2.class == (NullPiece) && @moves_taken == 0

    pos
  end

  def symbol
    :P
  end

  def moves
    possible_moves = []

    possible_moves += take_piece
    possible_moves + vert_moves
  end
end
