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

    describe "#print_board" do

      it "prints the empty board" do

        expect(@output).to receive(:puts).with("   |   |   ")
        expect(@output).to receive(:puts).with("-----------")
        expect(@output).to receive(:puts).with("   |   |   ")
        expect(@output).to receive(:puts).with("-----------")
        expect(@output).to receive(:puts).with("   |   |   ")

        @game.start
        @game.print_board

      end

      it "prints the winning board" do

        expect(@output).to receive(:puts).with(" X | O | O ")
        expect(@output).to receive(:puts).with("-----------")
        expect(@output).to receive(:puts).with("   | X |   ")
        expect(@output).to receive(:puts).with("-----------")
        expect(@output).to receive(:puts).with("   |   | X ")

        @game.start
        @game.make_move('X', 0, 0)
        @game.make_move('O', 0, 1)
        @game.make_move('O', 0, 2)
        @game.make_move('X', 1, 1)
        @game.make_move('X', 2, 2)
        @game.print_board

      end

    end

    describe "#cpu_turn" do

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

  end

end
