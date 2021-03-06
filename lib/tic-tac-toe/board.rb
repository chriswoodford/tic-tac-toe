module TicTacToe

  class Board

    ROW_HEADERS = ["A", "B", "C"]
    COLUMN_HEADERS = ["1", "2", "3"]

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

    def at(row, col)
      @board[x(row)][y(col)]
    end

    def remove(row, col)
      set(row, col, " ")
    end

    def flatten
      @board.flatten
    end

    def eql?(other_board)
      flatten == other_board.flatten
    end

    def accept_move(char, row, col)

      unless at(row, col) == " "
        raise InvalidMoveError.new
      end

      set(row, col, char)

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
      return "X" if x_is_winner?(all_lines)
      return "O" if o_is_winner?(all_lines)
      return ["X", "O"] if full?
    end

    protected

      def x(row)
        ROW_HEADERS.index(row)
      end

      def y(col)
        COLUMN_HEADERS.index(col)
      end

      def set(row, col, char)
        @board[x(row)][y(col)] = char
      end

      def horizontal_lines
        reduce_board(@board)
      end

      def vertical_lines
        board_rotated_clockwise = @board.transpose.map(&:reverse)
        reduce_board(board_rotated_clockwise)
      end

      def diagonal_lines
        forward_slash = [at('A', '1'), at('B', '2'), at('C', '3')]
        back_slash = [at('C', '1'), at('B', '2'), at('A', '3')]
        [forward_slash, back_slash].map { |row| row.join.strip }
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
