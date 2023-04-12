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
# potentially move results into its own method keeping track of inputs, like computer fired upon.
  def player_fire(player, computer, input)
    computer.board.cells[input].fire_upon
    player_result = computer.board.cells[input].render_result
    computer_result = player.board.cells[computer.cells_fired_upon.last].render_result
    results = "Your shot on #{input} #{player_result}. \n" +
    "My shot on #{computer.cells_fired_upon.last} #{computer_result}. \n"
    puts results
  end
end