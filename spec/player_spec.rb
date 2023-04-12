require "spec_helper"

RSpec.describe Player do
  before(:each) do 
    @user = Player.new
  end

  describe "initialize" do
    it "exists" do
      expect(@user).to be_a(Player)
      expect(@user.board).to be_a(Board)
      
      @user.board.place(@user.cruiser, ["A1", "A2", "A3"])
      
      expect(@user.board.cells["A1"].ship).to eq(@user.cruiser)
    end
  end
end