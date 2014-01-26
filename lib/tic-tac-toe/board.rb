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

    def full?
      empty_spaces = @board.flatten.count { |c| c == " " }
      true if empty_spaces == 0
    end

    def has_winner?

      # horizontal line
      return true if contains_winner? reduce_board(@board)

      # vertical line
      board_rotated_clockwise = @board.transpose.map(&:reverse)
      return true if contains_winner? reduce_board(board_rotated_clockwise)

      # diagonal line
      diagonal_lines = [
        @board[0][0].to_s + @board[1][1].to_s + @board[2][2].to_s,
        @board[0][2].to_s + @board[1][1].to_s + @board[2][0].to_s
      ]
      true if contains_winner? diagonal_lines

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

    protected

      def contains_winner?(lines)
        true if lines.include?("XXX") || lines.include?("OOO")
      end

      def reduce_board(board)
        board.map { |row| row.join.strip }
      end

  end

end
