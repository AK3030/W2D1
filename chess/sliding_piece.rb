module SlidingPiece

  DIAGS = [[1,1], [1,-1], [-1,-1], [-1,1]]
  LINES = [[-1,0], [1,0], [0,-1], [0,1]]

  def SlidingPiece.moves(curr_pos, directions, board)
    possible_moves = []

    if directions.include?(:diags)
      possible_moves += get_moves(curr_pos, board, DIAGS)
    end

    if directions.include?(:lines)
      possible_moves += get_moves(curr_pos, board, LINES)
    end

    possible_moves
  end

  def SlidingPiece.get_moves(curr_pos, board, dirs)
    possible_moves = []

    dirs.each do |dir|
      possible_moves += get_poss(curr_pos, board, dir)
    end

    possible_moves
  end

  def SlidingPiece.get_poss(curr_pos, board, dir)
    possible_moves = []
    temp = curr_pos.dup

    while true
      temp[0] += dir.first
      temp[1] += dir.last

      current_color = board[curr_pos].color

      break if board.in_bounds(temp) == false
      break if board[temp].color == current_color

      if board[temp].class != NullPiece && board[temp].color != current_color
        possible_moves << temp.dup
        break
      end

      possible_moves << temp.dup
    end

    possible_moves
  end
end


# b = Board.new
# d = Display.new(b)
# p SlidingPiece.moves([1,3], [:diag], b)
