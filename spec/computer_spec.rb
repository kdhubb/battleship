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
  
  describe "vertical_valid_placement" do
    it "creates valid vertical placements for ships" do
      expect(@macbook.vertical_valid_placement(@macbook.submarine).length).to eq(12)
      expect(@macbook.vertical_valid_placement(@macbook.cruiser).length).to eq(8)
    end
  end
  
  describe "all_valid_placements" do
    it "has all valid placements for computer to pull from" do
      expect(@macbook.all_valid_placements(@macbook.submarine).length).to eq(24)
    end
  end
  
  describe "random_ship_placement" do
    it "can place both ships randomly without overlapping" do
      expect(@macbook.random_ship_coords).to be_an(Array)
    end
  end

  describe "ship_placement" do
    it "places ships on board after random coords have been generated" do
      expect(@macbook.board).to be_a(Board)
      expect(@macbook.board.cells.values.to_s.include?("Cruiser")).to be false
      expect(@macbook.board.cells.values.to_s.include?("Submarine")).to be false

      @macbook.ship_placement

      expect(@macbook.board).to be_a(Board)
      expect(@macbook.board.cells.values.to_s.include?("Cruiser")).to be true
      expect(@macbook.board.cells.values.to_s.include?("Submarine")).to be true
    end
  end
end