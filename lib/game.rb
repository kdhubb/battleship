class Game
attr_reader :player, 
            :computer
  def initialize(player, computer)
    @player = player
    @computer = computer
  end
  
  def start
    puts "Welcome to BATTLESHIP\n" +
    "Enter p to play. Enter q to quit."
    start_response = gets.downcase.chomp 
    if start_response == "p"
      # @player = Player.new
      # @computer = Computer.new
      setup
    elsif start_response == "q"
      quit
    else
      "Enter p to play or q to quit."
      start_response
    end
    #until start response eqquals p or q....
  end

  def setup
    @computer.ship_placement
    puts "I have laid out my ships on the grid.\n" +
    "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long."
    puts @player.board.render
    player_cruiser_placement
  end
  
  def player_cruiser_placement
    puts "Enter the squares for the Cruiser (3 spaces):"
    raw_input = gets.split(" ")
    if @player.board.valid_placement?(@player.cruiser, raw_input)
      require 'pry'; binding.pry
      @player.board.place(@player.cruiser, raw_input)
      puts @player.board.render
      player_submarine_placement
    end
    # until @player.board.valid_placement?(@player.cruiser, raw_input)
    #   @player.board.place(@player.cruiser, raw_input)
    # end
  end
  
  def player_submarine_placement
    puts "Enter the squares for the Submarine (2 spaces):"
    raw_input = gets.split(" ")
    if @player.board.valid_placement?(@player.submarine, raw_input)
      @player.board.place(@player.submarine, raw_input)
      puts @player.board.render
      begin_firing
    end
    # until @player.board.valid_placement?(@player.cruiser, raw_input)
    #   @player.board.place(@player.cruiser, raw_input)
    # end
  end

  def begin_firing

  end

  def winner

  end
  
  def quit
  
  end
end