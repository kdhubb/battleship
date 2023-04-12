class Game
attr_reader :player, 
            :computer
  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def setup 
    
  end
end