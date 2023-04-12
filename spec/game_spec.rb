require "spec_helper"

RSpec.describe Game do 
  before(:each) do 
    @game = Game.new
    # @player = Player.new
    # @computer = Computer.new
  end
  
  describe "initialize" do 
    it "exists" do 
      expect(@game).to be_a(Game)
      expect(@game.player).to be nil
      expect(@game.computer).to be nil
    end
  end

  describe "new_players" do
    it "creates new players for the game" do
      @game.new_players
      
      expect(@game.player).to be_a(Player)
      expect(@game.computer).to be_a(Computer)
      expect(@game.computer.board.cells).to be_a(Hash)
    end
  end
  
  
  ## Need some serious work on tests with gets
  describe "gets" do
    context "start" do
      xit "starts - starts the game with a message" do
        @game.start
        
        expect(@game.computer.board.cells).to be_a(Hash)
      end
    end
  end
  
    context "setup" do
      xit "allows the player to enter their cruiser" do
        @game.setup

        expect(@game.computer.board.cells).to be_a(Hash)
      end
    end
  
    context "player_cruiser_placement" do
      xit "takes player input and warns of invalid coordinate" do
        @game.setup
        @game.player_cruiser_placement

        expect(@game.computer.board.cells).to be_a(Hash)
      end
    end
  end
end