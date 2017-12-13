class Piece
  attr_accessor :moves_taken, :pos

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

  def valid_moves
    valid_moves = []
    possible_moves = self.moves

    p self.class

    possible_moves.each do |new_pos|
      p "In the each"
      board_copy = @board.dup
      board_copy.move_piece(@pos, new_pos)
      valid_moves << new_pos unless board_copy.in_check?(@color)
    end

    valid_moves
  end

  def symbol
    "X"
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
