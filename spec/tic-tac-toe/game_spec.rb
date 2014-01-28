require 'spec_helper'

module TicTacToe

  describe Game do

    let(:empty_board) { Board.new }

    before(:each) do
      @presenter = double('presenter').as_null_object
      @game = Game.new(@output)
      @players = [Player.new('X'), Player.new('O')]
    end

    describe "#start" do

      before(:each) do
        @game.start(empty_board.dup, @players)
      end

      it "sets up an empty board" do
        expect(@game.board).to eql Board.new
      end

      it "adds the 2 players" do
        expect(@game).to have(2).players
      end

    end

    describe "#over?" do

      before(:each) do
        @game.start(empty_board, @players)
      end

      subject { @game }

      context "the board is not full" do

        context "has a winner" do

          before(:each) do
            @game.board.accept_move('X', 'A', '1')
            @game.board.accept_move('X', 'B', '2')
            @game.board.accept_move('X', 'C', '3')
          end

          it { should be_over }

        end

        context "does not have a winner" do
          it { should_not be_over }
        end

      end

      context "board is full" do

        before(:each) do
          fill_board_with_no_winner(@game.board)
        end

        it { should be_over }

      end

    end

    describe "#winner" do

      before(:each) do
        @game.start(empty_board, @players)
      end

      context "there is no winner yet" do
        it "winner is nil" do
          expect(@game.winner).to be_nil
        end
      end

      context "there is a winner" do

        it "is the winning player" do

          @game.board.accept_move('X', 'A', '1')
          @game.board.accept_move('X', 'B', '2')
          @game.board.accept_move('X', 'C', '3')

          expect(@game.winner).to be_a Player
          expect(@game.winner.mark).to eq "X"

        end

      end

      context "there is a tie" do

        it "is an array with both players" do
          fill_board_with_no_winner(@game.board)
          expect(@game.winner).to have(2).players
        end

      end

    end

    describe "#declare_winner" do
    end

  end

end
