class Game
attr_reader :player, 
            :computer
  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def start 
    # message for invalid ship placement
  end

  def winner

  end
  
  def end
  
  end
end