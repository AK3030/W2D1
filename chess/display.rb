require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    (0..7).each do |i|
      puts
      (0..7).each do |j|
        if @cursor.cursor_pos == [i,j]
          print @board[[i,j]].to_s.colorize(:red)
        else
          print @board[[i,j]].to_s
        end
      end
    end
  end

  def loop
    while true
      system("clear")
      render
      @cursor.get_input
    end
  end

end
#
b = Board.new
k = King.new([3,3], b)
q = Queen.new([3,4], b)
b[[3,3]] = k
b[[3,4]] = q
k.color = :B
q.color = :W
d = Display.new(b)
# d.loop
b.move_piece([3,3],[3,2])
# p b.in_check?(:B)
# p b[[6,0]]
