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
        row_counter = 0

        @output.puts "   #{col_headers.join("   ")} "

        board.to_a.map { |row| " #{row.join(" | ")} " }
          .insert(1, "-----------")
          .insert(3, "-----------")
          .each_with_index do |row, index|
            row_header = " "
            if index.even?
              row_header = "#{row_headers[row_counter]}"
              row_counter += 1
            end
            @output.puts "#{row_header} #{row}"
          end

      end

    end

  end

end
