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

  describe "fire_upon" do
    it "will fire upon the cell" do 
      @cell.place_ship(@cruiser)
      
      @cell.fire_upon

      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to be true
    end
  end  

  before(:each) do 
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
  end

  describe "render" do 
    it "will return a . for an empty cell not fired upon" do 
      expect(@cell_1.render).to eq(".")
    end

    it "will return M if the cell has been fired upon" do 
      @cell_1.fire_upon

      expect(@cell_1.render).to eq("M")
    end

    it "will hide ships during game play" do 
      @cell_2.place_ship(@cruiser)

      expect(@cell_2.render).to eq(".")
    end

    it "will show all ships for debugging" do 
      @cell_2.place_ship(@cruiser)

      expect(@cell_2.render(true)).to eq("S")
    end

    it "will show H if cell has been fired upon and contains a ship" do 
      @cell_2.place_ship(@cruiser)
      @cell_2.fire_upon

      expect(@cell_2.render).to eq("H")
      expect(@cell_2.render(true)).to eq("H")
    end

    it "will show X if ship has been sunk" do 
      @cell_2.place_ship(@cruiser)
      @cell_2.fire_upon
      
      expect(@cruiser.sunk?).to be false
      
      @cruiser.hit
      @cruiser.hit
      
      expect(@cruiser.sunk?).to be true
      expect(@cell_2.render).to eq("X")
    end
  end
  
  describe "render_result" do
    it "displays results" do
      @cell_2.place_ship(@cruiser)
      @cell_2.fire_upon
      
      expect(@cell_2.render_result).to eq("was a hit")
      
      @cruiser.hit
      @cruiser.hit
      
      expect(@cruiser.sunk?).to be true
      expect(@cell_2.render_result).to eq("sunk my ship")
    end
  end
end