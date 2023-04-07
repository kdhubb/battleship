require "spec_helper"

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "initialize" do
    it "exists" do
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.health).to eq(3)
    end
  end

  describe "sunk?" do
    it "returns whether a ship is sunk" do
      expect(@cruiser.sunk?).to be false
    end
  end
 
  describe "hit" do
    it "diminish health by one" do
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
    end

    it "works with sunk? and health?" do
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to be false
      
      @cruiser.hit
      expect(@cruiser.health).to eq(0)
      expect(@cruiser.sunk?).to be true
    end
  end
end