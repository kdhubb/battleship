require "spec_helper"

RSpec.describe Cell do
  before(:each) do 
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "coordinate" do 
    it "exists" do 
      expect(@cell.coordinate).to eq("B4")
    end
  end

end