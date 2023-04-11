require "spec_helper"

RSpec.describe Computer do
  before(:each) do 
    @macbook = Computer.new
  end

  describe "initialize" do
    it "exists" do
      expect(@macbook).to be_a(Computer)
      expect(@macbook.board).to be_a(Board)
      
      @macbook.board.place(@macbook.cruiser, ["A1", "A2", "A3"])
      
      expect(@macbook.board.cells["A1"].ship).to eq(@macbook.cruiser)
    end
  end
  
  describe "horizontal_valid_placement" do
    it "creates valid horizontal placements for ships" do
      expect(@macbook.horizontal_valid_placement(@macbook.submarine).length).to eq(12)
      expect(@macbook.horizontal_valid_placement(@macbook.cruiser).length).to eq(8)
    end
  end


end