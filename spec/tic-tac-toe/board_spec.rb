require 'spec_helper'

module TicTacToe

  describe Board do

    before(:each) do
      @board = Board.new
    end

    subject { @board }

    describe "#full?" do

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

    describe "#winner" do

      subject { @board.winner }

      context "there is no winner yet" do
        it { should be_nil }
      end

      context "X is the winner" do

        before(:each) do
          @board.accept_move('X', 0, 0)
          @board.accept_move('X', 0, 1)
          @board.accept_move('X', 0, 2)
        end

        it { should eq "X" }

      end

      context "O is the winner" do

        before(:each) do
          @board.accept_move('O', 0, 0)
          @board.accept_move('O', 1, 0)
          @board.accept_move('O', 2, 0)
        end

        it { should eq "O" }

      end

      context "it is a tie" do

        before(:each) do
          @board.accept_move('O', 0, 0)
          @board.accept_move('X', 0, 1)
          @board.accept_move('O', 0, 2)
          @board.accept_move('X', 1, 0)
          @board.accept_move('O', 1, 1)
          @board.accept_move('X', 1, 2)
          @board.accept_move('X', 2, 0)
          @board.accept_move('O', 2, 1)
          @board.accept_move('X', 2, 2)
        end

        it { should eq ["X", "O"] }

      end

    end

    describe "#has_winner?" do

      context "three of the same character in a line" do

        context "horizontal line" do

          before(:each) do
            @board.accept_move('X', 0, 0)
            @board.accept_move('O', 1, 1)
            @board.accept_move('X', 0, 1)
            @board.accept_move('O', 2, 2)
            @board.accept_move('X', 0, 2)
          end

          it { should have_winner }

        end

        context "vertical line" do

          before(:each) do
            @board.accept_move('X', 0, 0)
            @board.accept_move('O', 1, 1)
            @board.accept_move('X', 1, 0)
            @board.accept_move('O', 2, 2)
            @board.accept_move('X', 2, 0)
          end

          it { should have_winner }

        end

        context "diagonal line" do

          before(:each) do
            @board.accept_move('X', 1, 1)
            @board.accept_move('O', 0, 0)
            @board.accept_move('X', 2, 0)
            @board.accept_move('O', 2, 2)
            @board.accept_move('X', 0, 2)
          end

          it { should have_winner }

        end

      end

      context "no line of three characters" do

        before(:each) do
          @board.accept_move('O', 0, 0)
          @board.accept_move('X', 0, 1)
          @board.accept_move('O', 0, 2)
          @board.accept_move('X', 1, 0)
          @board.accept_move('O', 1, 1)
          @board.accept_move('X', 1, 2)
          @board.accept_move('X', 2, 0)
          @board.accept_move('O', 2, 1)
          @board.accept_move('X', 2, 2)
        end

        it { should_not have_winner }

      end

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
