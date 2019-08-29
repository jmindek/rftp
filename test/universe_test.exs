defmodule Rftp.UniverseTest do
  use ExUnit.Case, async: true

  setup do
    universe = start_supervised!(Rftp.Universe)
    %{universe: universe}
  end

  test "adds planets", %{universe: universe} do
    assert Rftp.Universe.get_planet(universe, "Alpha Prime") == :error

    Rftp.Universe.put_planet(universe, "Alpha Prime")
    {:ok, planet} = Rftp.Universe.get_planet(universe, "Alpha Prime")
    assert Map.has_key?(planet, :size)
  end

  test "creates universe", %{universe: universe} do
    new_verse = Rftp.Universe.create_universe(universe)
    assert Map.has_key?(new_verse, :size)
    assert Map.has_key?(new_verse, :planets)
    # TODO replace this brittle test
    planet_names = Map.keys(new_verse[:planets])
    assert Enum.any?(
      planet_names,
      fn name -> String.contains?(Atom.to_string(name), "Alpha Prime") end
    )
  end
  
end
