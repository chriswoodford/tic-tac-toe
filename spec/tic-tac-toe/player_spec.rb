require 'spec_helper'

module TicTacToe

  describe Player do

    before(:each) do
      @board = double('board').as_null_object
      @player = Player.new('O')
    end

    describe "#make_move" do

      it "updates the game board" do
        expect(@board).to receive(:accept_move).with(@player.mark, 1, 1)
        @player.make_move(@board, 1, 1)
      end

    end

    describe "#take_turn" do

      before(:each) do
        @player.stub(:get_coords).and_return([1, 2])
      end

      it "makes a move" do
        expect(@player).to receive(:make_move).with(@board, 1, 2)
        @player.take_turn(@board)
      end

      it "returns the move made" do
        expect(@player.take_turn(@board)).to eq "Player moved to 1, 2"
      end

    end

    describe "#to_s" do
      it "is Player" do
        expect(@player.to_s).to eq "Player"
      end
    end

    describe "#prompt" do
      it "returns Player make a move:" do
        expect(@player.prompt).to eq "Player make a move:"
      end
    end

    describe "#re_prompt" do
      it "returns Player please choose again" do
        expect(@player.re_prompt).to eq "Player please choose again"
      end
    end

  end

end
