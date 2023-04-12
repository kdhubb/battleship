class Game
attr_reader :player, 
            :computer
  def initialize
    @player = nil
    @computer = nil
    @turn = nil
  end

  def new_players
    @player = Player.new
    @computer = Computer.new
  end
  
  def start
    new_players
    puts "Welcome to BATTLESHIP\n" +
    "Enter p to play. Enter q to quit."
    start_response = gets.downcase.chomp 
    if start_response == "p"
      setup
    elsif start_response == "q"
      quit
    else
      "Enter p to play or q to quit."
      start
    end
    #until start response eqquals p or q....
  end

  def setup
    @computer.ship_placement
    puts "I have laid out my ships on the grid.\n" +
    "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long."
    puts @player.board.render(true)
    player_cruiser_placement
  end
  
  def player_cruiser_placement
    puts "Enter the squares for the Cruiser (3 spaces):"
    raw_input = gets.upcase.split(" ")
    if @player.board.valid_placement?(@player.cruiser, raw_input)
      @player.board.place(@player.cruiser, raw_input)
      puts @player.board.render(true)
      player_submarine_placement
    end
    ## Still need sad path for invalid coordinates
    # until @player.board.valid_placement?(@player.cruiser, raw_input)
    #   @player.board.place(@player.cruiser, raw_input)
    # end
  end
  
  def player_submarine_placement
    puts "Enter the squares for the Submarine (2 spaces):"
    raw_input = gets.upcase.split(" ")
    if @player.board.valid_placement?(@player.submarine, raw_input)
      @player.board.place(@player.submarine, raw_input)
      puts @player.board.render(true)
      begin_firing
    end
    ## Still need sad path for invalid coordinates
    # until @player.board.valid_placement?(@player.cruiser, raw_input)
    #   @player.board.place(@player.cruiser, raw_input)
    # end
  end

  def begin_firing
    @turn = Turn.new
    puts @turn.render_boards(@computer, @player)
    puts "Enter the coordinate for your shot:"
    shot_input = gets.chomp.upcase
    @turn.computer_fire(@computer, @player)
    @turn.player_fire(@player, @computer, shot_input)
  end

  def winner

  end
  
  def quit
  
  end
end