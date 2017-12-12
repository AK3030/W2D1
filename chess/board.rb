require_relative "piece.rb"

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    [0,1,6,7].each do |i|
      @grid[i].each_index do |j|
        @grid[i][j] = Piece.new
      end
    end

  end

  def in_bounds(pos)
    return false if pos[0] > 7 || pos[1] > 7
    return false if pos[0] < 0 || pos[1] < 0
    true
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x,y = pos
    @grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise IllegalMove unless self[start_pos]
    raise IllegalMove if self[end_pos]
  end

end

class IllegalMove < StandardError
end
