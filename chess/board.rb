require_relative "pieces.rb"

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    [0,1,6,7].each do |i|
      @grid[i].each_index do |j|
        @grid[i][j] = Piece.new([i,j], self)
      end
    end

    init_board

  end

  def init_board
    to_arr = ['Rook', 'Knight', 'Bishop', 'Queen', 'King', 'Bishop', 'Knight', 'Rook']
    to_arr.each.with_index {|el, i| @grid[0][i] = Object.const_get(el).new([0,i], self)}
    to_arr.reverse.each.with_index {|el, i| @grid[7][i] = Object.const_get(el).new([0,i], self)}
    @grid[1].map.with_index {|el,i| Pawn.new([1,i], self)}
    @grid[6].map.with_index {|el,i| Pawn.new([6,i], self)}

    @grid[0].each {|el| el.color = :B}
    @grid[1].each {|el| el.color = :B}
    @grid[6].each {|el| el.color = :W}
    @grid[7].each {|el| el.color = :W}


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


# b = Board.new
