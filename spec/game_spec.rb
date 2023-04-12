require "spec_helper"

RSpec.describe Game do 
  before(:each) do 
    @player = Player.new
    @computer = Computer.new
    @game = Game.new(@player, @computer)
  end

  describe "initialize" do 
    xit "exists" do 
      expect(@game).to be_a(Game)
      expect(@game.player).to be_a(Player)
      expect(@game.computer).to be_a(Computer)
    end
  end

  describe "start" do
    xit "starts the game with a message" do
      puts @game.start

      expect(@game.computer.board.cells).to be_a(Hash)
    end
  end
  
  describe "setup" do
    xit "allows the player to enter their cruiser" do
      @game.setup

      expect(@game.computer.board.cells).to be_a(Hash)
    end
  end
  
  describe "player_cruiser_placement" do
    it "takes player input and warns of invalid coordinate" do
      @game.setup
      @game.player_cruiser_placement

      expect(@game.computer.board.cells).to be_a(Hash)
    end
  end
end