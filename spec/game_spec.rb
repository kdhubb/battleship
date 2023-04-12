require "spec_helper"

RSpec.describe Game do 
  before(:each) do 
    @game = Game.new
  end

  describe "initialize" do 
    it "exists" do 
      expect(@game).to be_a(Game)
      expect(@game.player).to be_a(Player)
      expect(@game.computer).to be_a(Computer)
    end
  end
end