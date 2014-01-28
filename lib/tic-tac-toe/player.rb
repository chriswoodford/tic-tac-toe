module TicTacToe

  class Player

    attr_accessor :mark

    def initialize(mark)
      @mark = mark
    end

    def to_s
      "Player"
    end

    def make_move(board, x, y)
      board.accept_move(mark, x, y)
    end

    def prompt
      to_s + " make a move:"
    end

    def re_prompt
      to_s + " please choose again"
    end

    def take_turn(board)
      coords = get_coords
      make_move(board, coords[0], coords[1])
      to_s + " moved to " + coords.join(", ")
    end

    protected

      def get_coords
        player_input = gets.chomp!
        if player_input.include?(',')
          move = player_input.split(',')
        else
          move = [player_input[0], player_input[1]]
        end
        [move[0].upcase, move[1]]
      end

  end

  class Cpu < Player

    def to_s
      "CPU"
    end

    def prompt
    end

    def re_prompt
    end

    protected

      def get_coords
        [Board::ROW_HEADERS[rand(3)], Board::COLUMN_HEADERS[rand(3)]]
      end

  end

end
