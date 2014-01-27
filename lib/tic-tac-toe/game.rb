module TicTacToe

  class Game

    attr_accessor :board

    def initialize(presenter)
      @presenter = presenter
    end

    def start(board)
      @board = board
    end

    def print_board
      @presenter.print(@board)
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

        while true

          player_turn

          player_input = gets
          move = player_input.chomp!.split(',')

          begin
            make_move('O', move[0].to_i, move[1].to_i)
            break
          rescue InvalidMoveError
            puts "Please choose again"
          end

        end

        print_board

      end

      puts "You win!" if winner == "O"
      puts "You lose!" if winner == "X"
      puts "It's a tie!" if tie?

    end

  end

end
