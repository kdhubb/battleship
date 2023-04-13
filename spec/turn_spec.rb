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
      expect(@turn.render_boards(@computer, @player)).to eq("\n ============COMPUTER BOARD============ \n            1 2 3 4 \n          A . . . . \n          B . . . . \n          C . . . . \n          D . . . . \n\n =============PLAYER BOARD============= \n            1 2 3 4 \n          A . . . . \n          B . . . . \n          C . . . . \n          D . . . . \n")
    end

    it "displays player and computer boards during a turn" do 
      @player.board.place(@player.cruiser, ["A1", "A2", "A3"])
      @player.board.place(@player.submarine, ["B1", "C1"])
      @computer.ship_placement

      puts @turn.render_boards(@computer, @player, true)
    end
  end
  
  describe "computer_fire" do 
    it "fires randomly on player board" do 
      @turn.computer_fire(@computer, @player)
      @turn.computer_fire(@computer, @player)
      @turn.computer_fire(@computer, @player)
      
      puts @turn.render_boards(@computer, @player, true)
    end
  end
  
  describe "player_fire" do 
    it "fires randomly on player board" do 
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "A1")
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "B2")
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "D3")
      
      puts @turn.render_boards(@computer, @player, true)
    end
    
    it "prompts user to enter valid coordinate if invalid coordinate is entered" do 
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "B2")
      
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "E1")
    end
    
    it "lists two lines of results after player and computer have fired" do 
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "A1")
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "B1")
      @turn.computer_fire(@computer, @player)
      
      puts @turn.player_fire(@player, @computer, "B3")
    end
  end
  
  describe "render all types of computer and player shots" do 
    it "will display all types of actions on player and computer boards" do 
      @player.board.place(@player.cruiser, ["A1", "A2", "A3"])
      @player.board.place(@player.submarine, ["B1", "C1"])
      @computer.ship_placement
      @turn.computer_fire(@computer, @player)
      puts @turn.player_fire(@player, @computer, "B1")
      
      puts @turn.render_boards(@computer, @player, true)
    end
  end
end