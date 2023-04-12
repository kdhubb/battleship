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
    end
  end

  describe "render_boards" do 
    it "displays player and computer boards at the start of a turn" do 
      
      expect(@turn.render_boards).to be nil
    end
  end
end