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
        player_input = gets
        move = player_input.chomp!.split(',')
        [move[0].to_i, move[1].to_i]
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
        [rand(3), rand(3)]
      end

  end

end
