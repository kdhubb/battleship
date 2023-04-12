class Turn

  def render_boards(computer, player)
    board = "============COMPUTER BOARD============ \n" +
    computer.board.render +
    "=============PLAYER BOARD============= \n" +
    player.board.render
    puts board
  end

  def computer_shot

  end

  def player_shot

  end

  def results

  end

end