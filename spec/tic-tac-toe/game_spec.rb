require 'spec_helper'

module TicTacToe

  describe Game do

    let(:empty_board) do
      [
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
      ]
    end

    before(:each) do
      @output = double('output').as_null_object
      @game = Game.new(@output)
    end

    describe "#start" do

      it "sets up an empty board" do

        @game.start
        expect(@game.board).to eq empty_board

      end

    end

    describe "#cpu_turn" do

      it "makes a move" do

        @game.start
        @game.cpu_turn

        expect(@game.board).to_not eq empty_board

      end

      it "describes the CPU's move" do

        expect(@output).to receive(:puts).with(/^CPU moves to/)

        @game.start
        @game.cpu_turn

      end

    end

    describe "#player_turn" do

      it "prompts the Player to make a move" do

        expect(@output).to receive(:puts).with("Player make a move:")

        @game.start
        @game.player_turn

      end

    end

    describe "#make_move" do

      it "updates the game board" do

        board = empty_board
        board[1][1] = "O"

        @game.start
        @game.make_move("O", 1, 1)

        expect(@game.board).to eq board

      end

    end

    describe "#over?" do

      subject { @game }

      context "the board is not full" do

        context "has a winner" do
          it { should be_over }
        end

        context "does not have a winner" do
          it { should_not be_over }
        end

      end

      context "board is full" do
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
