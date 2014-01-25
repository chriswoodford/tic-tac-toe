module TicTacToe

  class Board

    def initialize
      @board = [
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
      ]
    end

    def accept_move(char, x, y)
      @board[x][y] = char
    end

    def print(output)

      @board.each_with_index do |row, index|

        built_row = ""

        row.each_with_index do |col, index|

          built_row += " #{col} "

          if index < 2
            built_row += "|"
          end

        end

        output.puts built_row

        if index < 2
          output.puts "-----------"
        end

      end

    end

  end

end
