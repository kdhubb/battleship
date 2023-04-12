class Turn

  def render_boards(computer, player, param = false)
    board = "============COMPUTER BOARD============ \n" +
    computer.board.render(param) +
    "=============PLAYER BOARD============= \n" +
    player.board.render(param)
    puts board
  end

  def computer_fire(computer, player)
    computer.computer_shot(player)
  end

  def player_fire(computer, input)
    computer.board.cells[input].fire_upon
    results = "Your shot on #{input} was a miss. \n" +
    "My shot on #{computer.cells_fired_upon.last} was a miss. \n"
    puts results
  end
end