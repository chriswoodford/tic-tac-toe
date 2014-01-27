module TicTacToe

  class Player

    attr_accessor :mark

    def initialize(mark)
      @mark = mark
    end

    def make_move(board, x, y)
      board.accept_move(mark, x, y)
    end

  end

end

