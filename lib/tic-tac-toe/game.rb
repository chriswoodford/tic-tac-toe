module TicTacToe

  class Game

    attr_accessor :board

    def initialize(output)
      @output = output
    end

    def start(board)
      @board = board
    end

    def make_move(char, x, y)
      @board.accept_move(char, x, y)
    end

    def print_board
      @board.print(@ouput)
    end

    def cpu_turn
      x, y = rand(3), rand(3)
      make_move("X", x, y)
      @output.puts "CPU moves to [#{x}, #{y}]"
    end

    def player_turn
      @output.puts "Player make a move:"
    end

    def over?
      true if @board.full? || @board.has_winner?
    end

    def winner
      @board.winner if @board.has_winner?
    end

    def tie
      @board.tie
    end

  end

end
