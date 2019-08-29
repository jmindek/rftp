defmodule LoopUtils do
  @moduledoc """
  Game loop processors.
  """

  @doc """
  """
  def process_user_input do
    _parse_input(IO.gets("> "))
  end

  def update_universe do
    true
  end

  def render do
    true
  end


  def _parse_input(input) do
    case input do
      "quit\n" -> :stop
      "help\n" -> IO.puts("Enter quit to stop.")
    end
  end

end
