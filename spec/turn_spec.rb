require "spec_helper"

RSpec.describe Turn do 
  before(:each) do
    @turn = Turn.new
    @player = Player.new
    @computer = Computer.new
  end

  describe "initialize" do 
    it "exists" do 
      expect(@turn).to be_a(Turn)
    end
  end

  describe "render_boards" do 
    it "displays player and computer boards at the start of a turn" do 
      expect(@turn.render_boards(@computer, @player)).to be nil
    end

    it "displays player and computer boards during a turn" do 
      @player.board.place(@player.cruiser, ["A1", "A2", "A3"])
      @player.board.place(@player.submarine, ["B1", "C1"])
      @computer.ship_placement

      expect(@turn.render_boards(@computer, @player, true)).to be nil
    end
  end
  
  describe "computer_fire" do 
    it "fires randomly on player board" do 
      @turn.computer_fire(@computer, @player)
      @turn.computer_fire(@computer, @player)
      @turn.computer_fire(@computer, @player)
      
      expect(@turn.render_boards(@computer, @player, true)).to be nil
    end
  end
end