module TicTacToe

  class Game

    attr_accessor :board, :players

    def initialize(presenter)
      @presenter = presenter
    end

    def start(board, players)
      @board = board
      @players = players
    end

    def print_board
      @presenter.print_board(@board)
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

    def prompt(player)
      @presenter.puts player.prompt unless player.prompt == nil
    end

    def re_prompt(player)
      @presenter.puts player.re_prompt unless player.re_prompt == nil
    end

    def play(brd, plrs)

      start(brd, plrs)
      print_board

      players.cycle(9) do |player|

        while true
          begin
            prompt player
            @presenter.puts player.take_turn(board)
            break
          rescue InvalidMoveError
            re_prompt player
          end
        end

        print_board

        if over?
          break # might need to use throw here
        end

      end

      puts "You win!" if winner == "O"
      puts "You lose!" if winner == "X"
      puts "It's a tie!" if tie?

    end

  end

end
