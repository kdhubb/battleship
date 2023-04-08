require "spec_helper"

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  
  describe "initialize" do
    it "exists" do
      expect(@board).to be_a(Board)
      expect(@board.cells).to be_a(Hash)
    end
  end
end