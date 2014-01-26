module TicTacToe

  class Board

    def initialize
      @board = [
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
      ]
    end

    def to_a
      @board
    end

    def at(x, y)
      @board[x][y]
    end

    def remove(x, y)
      @board[x][y] = " "
    end

    def flatten
      @board.flatten
    end

    def eql?(other_board)
      flatten == other_board.flatten
    end

    def accept_move(char, x, y)

      if at(x, y) == " "
        @board[x][y] = char
      else
        raise InvalidMoveError.new
      end

    end

    def full?
      empty_spaces = @board.flatten.count { |c| c == " " }
      true if empty_spaces == 0
    end

    def tie?
      true if winner == ["X", "O"]
    end

    def has_winner?

      # horizontal line
      return true if contains_winner? horizontal_lines

      # vertical line
      return true if contains_winner? vertical_lines

      # diagonal line
      true if contains_winner? diagonal_lines

    end

    def winner
      all_lines = horizontal_lines + vertical_lines + diagonal_lines
      if x_is_winner?(all_lines)
        "X"
      elsif o_is_winner?(all_lines)
        "O"
      elsif full?
        ["X", "O"]
      end
    end

    protected

      def horizontal_lines
        reduce_board(@board)
      end

      def vertical_lines
        board_rotated_clockwise = @board.transpose.map(&:reverse)
        reduce_board(board_rotated_clockwise)
      end

      def diagonal_lines
        [
          at(0, 0).to_s + at(1, 1).to_s + at(2, 2).to_s,
          at(0, 2).to_s + at(1, 1).to_s + at(2, 0).to_s
        ]
      end

      def x_is_winner?(lines)
        lines.include?("XXX")
      end

      def o_is_winner?(lines)
        lines.include?("OOO")
      end

      def contains_winner?(lines)
        true if x_is_winner?(lines) || o_is_winner?(lines)
      end

      def reduce_board(board)
        board.map { |row| row.join.strip }
      end

  end

  class InvalidMoveError < StandardError
  end

end
