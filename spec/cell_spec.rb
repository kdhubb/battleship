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

end