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
    
    context "horizontal placements" do
      it "makes sure the coordinates are consecutive" do
        expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be false
        expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be false
        expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be false
        expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be false
      end
    end
    
    context "diagonal placements" do
      it "diagonal placements are invalid" do
        expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be false
        expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be false
      end
    end
    
    context "vertical placements" do
      it "checks both vertical and horizontal placements" do
        expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be true
        expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be true
      end
    end
    
    context "validation" do
      it "checks both vertical and horizontal placements" do
        expect(@board.valid_placement?(@submarine, ["D3", "D4"])).to be true
        expect(@board.valid_placement?(@submarine, ["D4", "D5"])).to be false
        expect(@board.valid_placement?(@submarine, ["E1", "E2"])).to be false
        expect(@board.valid_placement?(@submarine, ["B1", "B3"])).to be false
        expect(@board.valid_placement?(@submarine, ["B2", "B3"])).to be true
        expect(@board.valid_placement?(@submarine, ["C1", "C2"])).to be true
        expect(@board.valid_placement?(@submarine, ["C1", "C2", "C3"])).to be false
        expect(@board.valid_placement?(@cruiser, ["D2", "D3", "D4"])).to be true
        expect(@board.valid_placement?(@cruiser, ["D3", "D4", "D5"])).to be false
        expect(@board.valid_placement?(@cruiser, ["E1", "E2", "E3"])).to be false
        expect(@board.valid_placement?(@cruiser, ["B1", "B3", "B4"])).to be false
        expect(@board.valid_placement?(@cruiser, ["B2", "B3", "B4"])).to be true
        expect(@board.valid_placement?(@cruiser, ["C1", "C2", "C3"])).to be true
        expect(@board.valid_placement?(@cruiser, ["C1", "C2", "C3", "C4"])).to be false
        expect(@board.valid_placement?(@cruiser, ["C1", "C2"])).to be false
        expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be true
      end
    end
  end

  describe "place" do 
    it "will place a ship in the cells specified" do 
      @board.place(@cruiser, ["A1", "A2", "A3"])    

      cell_1 = @board.cells["A1"]    
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"] 
         
      expect(cell_1.ship).to be_a Ship
      expect(cell_2.ship).to be_a Ship
      expect(cell_3.ship).to be_a Ship

      expect(cell_3.ship).to eq(cell_2.ship)
    end

    it "will not place overlapping ships" do 
      @board.place(@cruiser, ["A1", "A2", "A3"])
      
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to be false
    end
  end
  
  describe "coordinates available" do 
    it "will check if coordinates are available before placing ship" do 
      @board.place(@cruiser, ["A1", "A2", "A3"])

      expect(@board.coordinates_available?(@submarine, ["A1", "B1"])).to be false
      expect(@board.coordinates_available?(@submarine, ["B1", "B2"])).to be true
    end
  end

  describe "render" do 
    it "will illustrate the board" do 
      @board.place(@cruiser, ["A1", "A2", "A3"])
      
      expect(@board.render).to eq("            1 2 3 4 \n          A . . . . \n          B . . . . \n          C . . . . \n          D . . . . \n")
      expect(@board.render(true)).to eq("            1 2 3 4 \n          A S S S . \n          B . . . . \n          C . . . . \n          D . . . . \n")
    end
    
    it "will verify hits and sinks in game play and debugging" do 
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @board.cells["A1"].fire_upon
      
      expect(@board.render(true)).to eq("            1 2 3 4 \n          A H S S . \n          B . . . . \n          C . . . . \n          D . . . . \n")
      expect(@board.render).to eq("            1 2 3 4 \n          A H . . . \n          B . . . . \n          C . . . . \n          D . . . . \n")

      @board.cells["A2"].fire_upon
      @board.cells["A3"].fire_upon
      
      expect(@board.render).to eq("            1 2 3 4 \n          A X X X . \n          B . . . . \n          C . . . . \n          D . . . . \n")
    end

    it "will verify hits and sinks in game play and debugging" do 
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @board.cells["B1"].fire_upon
      @board.cells["A1"].fire_upon

      expect(@board.render(true)).to eq("            1 2 3 4 \n          A H S S . \n          B M . . . \n          C . . . . \n          D . . . . \n")
      expect(@board.render).to eq("            1 2 3 4 \n          A H . . . \n          B M . . . \n          C . . . . \n          D . . . . \n")
      expect(@board.render(true)).to eq("            1 2 3 4 \n          A H S S . \n          B M . . . \n          C . . . . \n          D . . . . \n")
      expect(@board.render).to eq("            1 2 3 4 \n          A H . . . \n          B M . . . \n          C . . . . \n          D . . . . \n")

      @board.cells["A2"].fire_upon
      @board.cells["A3"].fire_upon
      
      expect(@board.render).to eq("            1 2 3 4 \n          A X X X . \n          B M . . . \n          C . . . . \n          D . . . . \n")
    end
  end

  describe "general_valid?" do
    it "checks between horizontal and vertical coordinates" do
      expect(@board.general_valid?(@cruiser, ["A1", "A2", "A3"])).to be true
      expect(@board.general_valid?(@cruiser, ["C1", "A2", "A3"])).to be false
      expect(@board.general_valid?(@cruiser, ["A1", "B1", "C1"])).to be true
      expect(@board.general_valid?(@cruiser, ["A1", "B1", "D1"])).to be false
      expect(@board.general_valid?(@submarine, ["A1", "A2"])).to be true
      expect(@board.general_valid?(@submarine, ["C1", "A2"])).to be false
      expect(@board.general_valid?(@submarine, ["A1", "B1"])).to be true
      expect(@board.general_valid?(@submarine, ["A1", "C1"])).to be false
    end
  end
  
  describe "valid_ship_length?" do
    it "that the ship length provided is valid" do
      expect(@board.valid_ship_length?(@cruiser, ["A1", "A2", "A3"])).to be true
      expect(@board.valid_ship_length?(@cruiser, ["A2", "A3"])).to be false
      expect(@board.valid_ship_length?(@submarine, ["A1", "B1"])).to be true
      expect(@board.valid_ship_length?(@submarine, ["A1"])).to be false
    end
  end
end

