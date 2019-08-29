defmodule Rftp.Universe do
  use GenServer
  import Rftp.PlanetStats

  @moduledoc"""
  Interactions with the game universe.
  """

  def start_link(opts) do
    GenServer.start(__MODULE__, :ok, opts)
  end

  @doc"""
  Create a universe of random size and random planets.

  # TODO randomize the size
  # TODO randomize the number of planets generated
  """
  def create_universe(server) do
    # `size` is tuple with the x, y, and z max
    size = {100, 100, 100}
    # `planets` is Map of all the planets
    planets = put_and_get_planet(server)
    %{size: size, planets: planets}
  end


  @doc"""
  Create and return a new planet.

  TODO: Add universe size as parameter
  TODO: Add location for each planet created
  TODO: Add logic to prevent two planets for being to close
  """
  def put_and_get_planet(server) do
    name = generate_name()
    put_planet(server, name)
    %{String.to_atom(name) => get_planet(server, name)}
  end


  @doc"""
  Generate a name.

  # TODO replace the static name plus rand num with actual random names. 
  """
  def generate_name() do
    number = Enum.random(1..1_000)
    "Alpha Prime #{number}"
  end


  @doc"""
  Get a planet's stats.
  """
  def get_planet(server, name) do
    GenServer.call(server, {:get_planet, name})
  end

  @doc"""
  Add planet with it's stats to the universe.
  """
  def put_planet(server, name) do
    GenServer.cast(server, {:put_planet, name, generate_planet_stats})
  end

  @doc"""
  Randomly generate planet stats.
  """
  def generate_planet_stats() do
    # TODO
    # Add maximums for each a stat.
    %{
      size: get_size,
      colonized: colonized?,
      lsa: life_supporting_atmosphere?,
      posture: posture?,
      population: get_population,
      natural_resource: get_natural_resources,
      agriculture: get_agriculture,
      defenses: defenses?,
      army: army?,
      navy: navy?,
      diplomacy: get_diplomacy,
      xenophobic: xenophobic?,
      atmosphere: atmosphere?,
      explored: explored?,
      refilling_stations: fuel?
    }
  end
  
  # callbacks
  @impl true
  def init(:ok) do
    {:ok, %{
          :planets=>%{"Alpo7": %{population: 11}},
          :ships=>%{},
          :npbs=>%{} # non-planetary bodies
     }
    }
  end

  @impl true
  def handle_call({:get_planet, name}, _from, state) do
    {:reply, Map.fetch(state.planets, name), state}
  end

  @impl true
  def handle_cast({:put_planet, name, stats}, state) do
    if Map.has_key?(state, name) do
      {:noreply, state}
    else
      planets = Map.put(state.planets, name, stats)
      {:noreply, Map.put(state, :planets, planets)}
    end
  end

end
