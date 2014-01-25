module TicTacToe

  class Game

    attr_accessor :board

    def initialize(output)
      @output = output
    end

    def start

      @board = [
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
      ]

    end

    def make_move(char, x, y)
      @board[x][y] = char
    end

    def print_board

      @board.each_with_index do |row, index|

        built_row = ""

        row.each_with_index do |col, index|

          built_row += " #{col} "

          if index < 2
            built_row += "|"
          end

        end

        @output.puts built_row

        if index < 2
          @output.puts "-----------"
        end

      end

    end

    def cpu_turn
      make_move("X", 0, 0)
      @output.puts "CPU moves to [0, 0]"
    end

    def player_turn
      @output.puts "Player make a move:"
    end

  end

end
