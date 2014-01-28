require 'spec_helper'

module TicTacToe

  describe Board do

    before(:each) do
      @board = Board.new
    end

    subject { @board }

    describe "#accept_move" do

      context "a move already exists" do

        it "does not update the board" do

          @board.accept_move('X', 'A', '1')

          begin
            @board.accept_move('O', 'A', '1')
          rescue InvalidMoveError
            expect(@board.at('A', '1')).to eq "X"
          end

        end

        it "causes an invalid move error" do
          @board.accept_move('X', 'A', '1')
          expect { @board.accept_move('O', 'A', '1') }.to
            raise_error(InvalidMoveError)
        end

      end

    end

    describe "#full?" do

      context "board is full" do

        before(:each) do
          fill_board_with_all_x(@board)
        end

        it { should be_full }

      end

      context "board is empty" do
        it { should_not be_full }
      end

      context "board has some empty spaces" do

        before(:each) do
          fill_board_with_all_x(@board)
          @board.remove('C', '3')
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
          @board.accept_move('X', 'A', '1')
          @board.accept_move('X', 'A', '2')
          @board.accept_move('X', 'A', '3')
        end

        it { should eq "X" }

      end

      context "O is the winner" do

        before(:each) do
          @board.accept_move('O', 'A', '1')
          @board.accept_move('O', 'B', '1')
          @board.accept_move('O', 'C', '1')
        end

        it { should eq "O" }

      end

      context "it is a tie" do

        before(:each) do
          fill_board_with_no_winner(@board)
        end

        it { should eq ["X", "O"] }

      end

    end

    describe "#has_winner?" do

      context "three of the same character in a line" do

        context "horizontal line" do

          before(:each) do
            @board.accept_move('X', 'A', '1')
            @board.accept_move('O', 'B', '2')
            @board.accept_move('X', 'A', '2')
            @board.accept_move('O', 'C', '2')
            @board.accept_move('X', 'A', '3')
          end

          it { should have_winner }

        end

        context "vertical line" do

          before(:each) do
            @board.accept_move('X', 'A', '1')
            @board.accept_move('O', 'B', '2')
            @board.accept_move('X', 'B', '1')
            @board.accept_move('O', 'C', '3')
            @board.accept_move('X', 'C', '1')
          end

          it { should have_winner }

        end

        context "diagonal line" do

          before(:each) do
            @board.accept_move('X', 'B', '2')
            @board.accept_move('O', 'A', '1')
            @board.accept_move('X', 'C', '1')
            @board.accept_move('O', 'C', '3')
            @board.accept_move('X', 'A', '3')
          end

          it { should have_winner }

        end

      end

      context "no line of three characters" do

        before(:each) do
          fill_board_with_no_winner(@board)
        end

        it { should_not have_winner }

      end

    end

  end

end
