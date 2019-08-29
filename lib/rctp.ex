defmodule Rftp do
  @moduledoc """
  The game loop.
  Get user input, update the universe, then render the universe.
  Sleep 1 sec.
  Repeat until user quits.
  """
  import LoopUtils

  def game_loop(:run) do
    continue = process_user_input()
    update_universe()
    render()
    IO.puts(">> The universe changed. <<")
    Process.sleep(100)  # per the help, there is probably a more correct way to do this.
    game_loop(continue)
  end

  def game_loop(:stop) do
    []
  end
end
