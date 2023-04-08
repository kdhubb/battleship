require "spec_helper"

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  
  describe "initialize" do
    it "exists" do
      expect(@board).to be_a(Board)
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells["A1"]).to be_a(Cell)
      expect(@board.cells["A1"].coordinate).to eq("A1")
      expect(@board.cells.length).to eq(16)
    end
  end
end