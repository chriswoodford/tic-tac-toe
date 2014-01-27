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

        it "prints the empty board" do

          expect(@output).to receive(:puts).with("   |   |   ")
          expect(@output).to receive(:puts).with("-----------")
          expect(@output).to receive(:puts).with("   |   |   ")
          expect(@output).to receive(:puts).with("-----------")
          expect(@output).to receive(:puts).with("   |   |   ")

          @presenter.print_board(@board)

        end

        it "prints the winning board" do

          expect(@output).to receive(:puts).with(" X | O | O ")
          expect(@output).to receive(:puts).with("-----------")
          expect(@output).to receive(:puts).with("   | X |   ")
          expect(@output).to receive(:puts).with("-----------")
          expect(@output).to receive(:puts).with("   |   | X ")

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
