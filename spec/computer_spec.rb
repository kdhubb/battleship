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
end