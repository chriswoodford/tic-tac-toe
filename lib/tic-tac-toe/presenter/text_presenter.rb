module TicTacToe

  module Presenter

    class TextPresenter

      def initialize(output)
        @output = output
      end

      def puts(msg)
        @output.puts(msg)
      end

      def print_board(board)

        board.to_a.each_with_index do |row, index|

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

    end

  end

end
