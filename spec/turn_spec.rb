require "spec_helper"

RSpec.describe Turn do 
  before(:each) do
    @turn = Turn.new
    @user = Player.new
    @macbook = Computer.new
  end

  describe "initialize" do 
    it "exists" do 
      expect(@turn).to be_a(Turn)
      expect(@turn.player).to be_a(Player)
      expect(@turn.macbook).to be_a(Computer)
    end
  end
end