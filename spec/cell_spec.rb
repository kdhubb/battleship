require "spec_helper"

RSpec.describe Cell do
  before(:each) do 
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "coordinate" do 
    it "exists" do 
      expect(@cell.coordinate).to eq("B4")
      expect(@cell.ship).to be nil
    end
  end

  describe "empty?" do 
    it "can check if a cell is empty" do 
      expect(@cell.empty?).to be true
    end
  end

  describe "place_ship" do
    it "can place a ship in a cell" do 
      @cell.place_ship(@cruiser)

      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to be false
    end
  end

  describe "fired_upon?" do
    it "can return whether a ship has been hit" do 
      @cell.place_ship(@cruiser)

      expect(@cell.fired_upon?).to be false
    end
  end

end