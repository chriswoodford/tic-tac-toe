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

        col_headers = ["1", "2", "3"]

        row_headers = ["A", "B", "C"]
        row_counter = -1

        @output.puts "   #{col_headers.join("   ")} "

        board.to_a
          .map do |row|
            row_counter += 1
            "#{row_headers[row_counter]}  #{row.join(" | ")} "
          end
          .insert(1, "  -----------")
          .insert(3, "  -----------")
          .each do |row|
            @output.puts row
          end

      end

    end

  end

end
