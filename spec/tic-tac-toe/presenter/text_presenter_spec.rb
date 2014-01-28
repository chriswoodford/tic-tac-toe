require 'spec_helper'

module TicTacToe

  module Presenter

    describe TextPresenter do

      before(:each) do
        @output = double('output').as_null_object
        @board = Board.new
        @presenter = TextPresenter.new(@output)
      end

      describe "#puts" do

        it "prints the supplied message" do
          message = "This is a message"
          expect(@output).to receive(:puts).with(message)
          @presenter.puts message
        end

      end

      describe "#print_board" do

        before(:each) do
          @a = Board::ROW_HEADERS[0]
          @b = Board::ROW_HEADERS[1]
          @c = Board::ROW_HEADERS[2]
          @col_header = "   " + Board::COLUMN_HEADERS.join("   ") + " "
        end

        it "prints the empty board" do

          expect(@output).to receive(:puts).with(@col_header)
          expect(@output).to receive(:puts).with("#{@a}    |   |   ")
          expect(@output).to receive(:puts).with("  -----------")
          expect(@output).to receive(:puts).with("#{@b}    |   |   ")
          expect(@output).to receive(:puts).with("  -----------")
          expect(@output).to receive(:puts).with("#{@c}    |   |   ")

          @presenter.print_board(@board)

        end

        it "prints the winning board" do

          expect(@output).to receive(:puts).with(@col_header)
          expect(@output).to receive(:puts).with("#{@a}  X | O | O ")
          expect(@output).to receive(:puts).with("  -----------")
          expect(@output).to receive(:puts).with("#{@b}    | X |   ")
          expect(@output).to receive(:puts).with("  -----------")
          expect(@output).to receive(:puts).with("#{@c}    |   | X ")

          @board.accept_move('X', 0, 0)
          @board.accept_move('O', 0, 1)
          @board.accept_move('O', 0, 2)
          @board.accept_move('X', 1, 1)
          @board.accept_move('X', 2, 2)

          @presenter.print_board(@board)

        end

      end

    end

  end

end
