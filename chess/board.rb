require_relative "pieces.rb"

class Board
  def initialize(grid = nil)
    @grid ||= Array.new(8) { Array.new(8) { NullPiece.instance } }
    # [0,1,6,7].each do |i|
    #   @grid[i].each_index do |j|
    #     @grid[i][j] = Piece.new([i,j], self)
    #   end
    # end

    init_board

  end

  def init_board
    to_arr = ['Rook', 'Knight', 'Bishop', 'Queen', 'King', 'Bishop', 'Knight', 'Rook']
    to_arr.each.with_index {|el, i| @grid[0][i] = Object.const_get(el).new([0,i], self)}
    to_arr.reverse.each.with_index {|el, i| @grid[7][i] = Object.const_get(el).new([0,i], self)}
    @grid[1].each.with_index {|el,i| @grid[1][i] = Pawn.new([1,i], self)}
    @grid[6].each.with_index {|el,i| @grid[6][i] = Pawn.new([6,i], self)}

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
    raise IllegalMove unless self[start_pos].valid_moves.include?(end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.instance
  end

  def in_check?(color)
    king_pos = nil

    @grid.each do |arr|
      arr.each do |el|
        if el.class == King && el.color == color
          king_pos = el.pos
        end
      end
    end

    @grid.each do |arr|
      arr.each do |el|
        if el.class != NullPiece && el.color != color
          return true if el.moves.include?(king_pos)
        end
      end
    end

    false
  end

  # def checkmate?(color)
  #   in_check?(color) && valid_moves.empty?
  # end


  def dup
    new_grid = Array.new(8) {Array.new(8)}
    @grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if el && el.class != NullPiece
          copy = el.dup
          copy.pos = el.pos.dup
        end
        new_grid[i][j] = copy
      end
    end
    Board.new(new_grid)
  end

end

class IllegalMove < StandardError
end

#

# p q.moves
