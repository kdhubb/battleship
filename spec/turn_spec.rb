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
  
  describe "player_fire" do 
    it "fires randomly on player board" do 
      @turn.player_fire(@computer, "A1")
      @turn.player_fire(@computer, "B2")
      @turn.player_fire(@computer, "D3")
      
      expect(@turn.render_boards(@computer, @player, true)).to be nil
    end

    it "lists two lines of results after player and computer have fired" do 
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@computer, "A1")
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@computer, "B1")
      @turn.computer_fire(@computer, @player)
  
      expect(@turn.player_fire(@computer, "B3")).to be nil
    end
  end
  #  might want to test further later on (H, X, S, etc.)
end