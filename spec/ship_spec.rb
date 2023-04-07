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
end
# cruiser.hit
# cruiser.health
# #=> 2
# cruiser.hit
# cruiser.health
# #=> 1
# cruiser.sunk?
# #=> false
# cruiser.hit

# cruiser.sunk?
# #=> true