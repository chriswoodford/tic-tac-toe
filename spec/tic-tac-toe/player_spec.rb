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

  end

end
