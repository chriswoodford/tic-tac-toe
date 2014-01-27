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

        board.to_a.map { |row| " #{row.join(" | ")} " }
          .insert(1, "-----------")
          .insert(3, "-----------")
          .each { |row| puts row }

      end

    end

  end

end
