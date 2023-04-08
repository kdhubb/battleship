require "spec_helper"

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2) 
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
 
  describe "valid_coordinate?" do
    it "checks to see if a coordinate is valid or exists" do
      expect(@board.valid_coordinate?("A1")).to be true
      expect(@board.valid_coordinate?("D4")).to be true
      expect(@board.valid_coordinate?("A5")).to be false
      expect(@board.valid_coordinate?("E1")).to be false
      expect(@board.valid_coordinate?("A22")).to be false
    end
  end
  
  describe "valid_placement?" do
    it "number of coordinates in the array should be the same as the length of the ship" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be false
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be false
      expect(@board.valid_placement?(@submarine, ["A2", "A3"])).to be true
    end
  end
end