class Piece
  attr_accessor :moves_taken

  def initialize(pos, board)
    @pos = pos
    @board = board
    @moves_taken = 0
  end

  def color=(sym)
    @color = sym
  end

  def color
    @color
  end

  def moves
  end

  def symbol
    "P"
  end

  def move_into_check(to_pos)
    @pos = to_pos
  end

  def to_s
    if @color == :B
      symbol.to_s.colorize(:blue)
    else
      symbol.to_s.colorize(:green)
    end
  end
end
