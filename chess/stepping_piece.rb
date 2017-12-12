require_relative "display.rb"

module SteppingPiece
  KNIGHT = [[-2,-1], [-2,1], [-1,2], [-1,-2], [1,-2], [1,2], [2,1], [2,-1]]
  KING = [[1,0], [0,1], [-1,0], [0,-1], [1,1], [1,-1], [-1,1], [-1,-1]]

  def SteppingPiece.moves(curr_pos, directions, board)
    possible_moves = []

    if directions.include?(:knight)
      possible_moves += get_moves(curr_pos, board, KNIGHT)
    end

    if directions.include?(:king)
      possible_moves += get_moves(curr_pos, board, KING)
    end

    possible_moves
  end

  def SteppingPiece.get_moves(curr_pos, board, dirs)
    possible_moves = []

    dirs.each do |dir|
      possible_moves += get_poss(curr_pos, board, dir)
    end

    possible_moves
  end

  def SteppingPiece.get_poss(curr_pos, board, dir)
    temp = curr_pos.dup

    temp[0] += dir.first
    temp[1] += dir.last
    if board[temp].class == (Piece) || board.in_bounds(temp) == false
      return []
    end

    [temp]
  end

end

b = Board.new
d = Display.new(b)
p SteppingPiece.moves([1,3], [:knight], b)
