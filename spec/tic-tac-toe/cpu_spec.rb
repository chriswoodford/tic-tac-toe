require 'spec_helper'

module TicTacToe

  describe Cpu do

    before(:each) do
      @board = double('board').as_null_object
      @player = Cpu.new('X')
    end

    describe "#to_s" do
      it "is CPU" do
        expect(@player.to_s).to eq "CPU"
      end
    end

    describe "#prompt" do
      it "returns nothing" do
        expect(@player.prompt).to be_nil
      end
    end

    describe "#re_prompt" do
      it "returns nothing" do
        expect(@player.re_prompt).to be_nil
      end
    end

  end

end
