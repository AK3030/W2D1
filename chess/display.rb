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

b = Board.new
d = Display.new(b)
d.loop
