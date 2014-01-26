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
      @board.print(@output)
    end

    def cpu_turn

      while true
        begin
          x, y = rand(3), rand(3)
          make_move("X", x, y)
          break
        rescue InvalidMoveError
          # let the CPU try
        end
      end

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

    def tie?
      @board.tie?
    end

    def play(board)

      start(board)
      print_board

      until over? do

        cpu_turn
        print_board

        if over?
          break
        end

        player_turn

        player_input = gets
        move = player_input.chomp!.split(',')

        make_move('O', move[0].to_i, move[1].to_i)
        print_board

      end

      puts "You win!" if winner == "O"
      puts "You lose!" if winner == "X"
      puts "It's a tie!" if tie?

    end

  end

end
