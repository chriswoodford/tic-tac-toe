require 'spec_helper'

module TicTacToe

  describe Board do

    before(:each) do
      @board = Board.new
    end

    describe "#full?" do

      subject { @board }

      context "board is full" do

        before(:each) do
          @board.accept_move('X', 0, 0)
          @board.accept_move('X', 0, 1)
          @board.accept_move('X', 0, 2)
          @board.accept_move('X', 1, 0)
          @board.accept_move('X', 1, 1)
          @board.accept_move('X', 1, 2)
          @board.accept_move('X', 2, 0)
          @board.accept_move('X', 2, 1)
          @board.accept_move('X', 2, 2)
        end

        it { should be_full }

      end

      context "board is empty" do
        it { should_not be_full }
      end

      context "board has some empty spaces" do

        before(:each) do
          @board.accept_move('X', 0, 0)
          @board.accept_move('X', 0, 1)
          @board.accept_move('X', 0, 2)
          @board.accept_move('X', 1, 0)
          @board.accept_move('X', 1, 1)
          @board.accept_move('X', 1, 2)
          @board.accept_move('X', 2, 0)
          @board.accept_move('X', 2, 1)
        end

        it { should_not be_full }

      end

    end

    describe "#has_winner?" do
    end

    describe "#print" do

      before(:each) do
        @output = double('output').as_null_object
      end

      it "prints the empty board" do

        expect(@output).to receive(:puts).with("   |   |   ")
        expect(@output).to receive(:puts).with("-----------")
        expect(@output).to receive(:puts).with("   |   |   ")
        expect(@output).to receive(:puts).with("-----------")
        expect(@output).to receive(:puts).with("   |   |   ")

        @board.print(@output)

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
        @board.print(@output)

      end

    end

  end

end
