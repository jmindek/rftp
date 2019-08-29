defmodule RftpTest do
  use ExUnit.Case
  import Mock

  test "Rftp.game_loop processes user input, updates and renders the universe." do
    with_mock LoopUtils,
      [process_user_input: fn() -> :stop end,
       update_universe: fn() -> true end,
       render: fn() -> true end
      ] do
      Rftp.game_loop(:run)
      assert called LoopUtils.process_user_input
      assert called LoopUtils.update_universe
      assert called LoopUtils.render
    end
  end

  test "Rftp.game_loop continues until user enters quit." do
    with_mock LoopUtils,
      [process_user_input: fn() -> :stop end,
       update_universe: fn() -> true end,
       render: fn() -> true end
      ] do
      Rftp.game_loop(:run)
      assert called LoopUtils.process_user_input
      assert called LoopUtils.update_universe
      assert called LoopUtils.render
    end
  end
end
