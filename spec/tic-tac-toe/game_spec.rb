require 'spec_helper'

module TicTacToe

  describe Game do

    let(:empty_board) { Board.new }

    before(:each) do
      @output = double('output').as_null_object
      @game = Game.new(@output)
    end

    describe "#start" do

      it "sets up an empty board" do

        @game.start(empty_board.dup)
        expect(@game.board).to eql Board.new

      end

    end

    describe "#cpu_turn" do

      it "makes a move" do

        @game.start(empty_board)
        @game.cpu_turn

        expect(@game.board).to_not eql Board.new

      end

      it "describes the CPU's move" do

        expect(@output).to receive(:puts).with(/^CPU moves to/)

        @game.start(empty_board)
        @game.cpu_turn

      end

    end

    describe "#player_turn" do

      it "prompts the Player to make a move" do

        expect(@output).to receive(:puts).with("Player make a move:")

        @game.start(empty_board)
        @game.player_turn

      end

    end

    describe "#make_move" do

      it "updates the game board" do

        board = empty_board.dup
        board.accept_move("O", 1, 1)

        @game.start(empty_board)
        @game.make_move("O", 1, 1)

        expect(@game.board).to eql board

      end

    end

    describe "#over?" do

      before(:each) do
        @game.start(empty_board)
      end

      subject { @game }

      context "the board is not full" do

        context "has a winner" do

          before(:each) do
            @game.make_move('X', 0, 0)
            @game.make_move('X', 1, 1)
            @game.make_move('X', 2, 2)
          end

          it { should be_over }
        end

        context "does not have a winner" do
          it { should_not be_over }
        end

      end

      context "board is full" do

        before(:each) do
          @game.make_move('O', 0, 0)
          @game.make_move('X', 0, 1)
          @game.make_move('O', 0, 2)
          @game.make_move('X', 1, 0)
          @game.make_move('O', 1, 1)
          @game.make_move('X', 1, 2)
          @game.make_move('X', 2, 0)
          @game.make_move('O', 2, 1)
          @game.make_move('X', 2, 2)
        end

        it { should be_over }

      end

    end

    describe "#winner" do

      context "there is a winner" do
      end

      context "there is a tie" do
      end

    end

  end

end
