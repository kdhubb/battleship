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
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "A1")
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "B2")
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "D3")
      
      expect(@turn.render_boards(@computer, @player, true)).to be nil
    end
    
    it "prompts user to enter valid coordinate if invalid coordinate is entered" do 
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "B2")
      
      # expect(@turn.render_boards(@computer, @player, true).to_s.include?("M")).to be true
      # unsure how to test for this ^. Should we test in pry or return a string value?
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "E1")
    end
    
    it "lists two lines of results after player and computer have fired" do 
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "A1")
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "B1")
      @turn.computer_fire(@computer, @player)
      
      expect(@turn.player_fire(@player, @computer, "B3")).to be nil
    end
  end
  
  describe "render all types of computer and player shots" do 
    it "will display all types of actions on player and computer boards" do 
      @player.board.place(@player.cruiser, ["A1", "A2", "A3"])
      @player.board.place(@player.submarine, ["B1", "C1"])
      @computer.ship_placement
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, "B1")
      
      expect(@turn.render_boards(@computer, @player, true)).to be nil
    end
  end
  #  might want to test further later on (H, X, S, etc.)
end