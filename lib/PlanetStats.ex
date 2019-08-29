 defmodule Rftp.PlanetStats do

  @doc"""
  Randomly return the diameter of the planet.
  """
  def get_size() do
    r = Enum.random(1_000..1_000_000)
    2 * r
  end

  @doc"""
  Randomly return whether the planet is colonized.
  This drives what attributes a Captain sees when reviewing a planet's stats.
  """
  def colonized?() do
    Enum.random([:true, :false])
  end

  @doc"""
  Randomly return whether the planet has been explored.
  This drives what attributes a Captain sees when reviewing a planet's stats.
  """
  def explored?() do
    Enum.random([:true, :false])
  end

  @doc"""
  Is the planet's atmosphere dangerous to traverse.
  This impacts a ships ability to move throught the atmo unharmed.
  """
  def atmosphere?() do
    Enum.random([:clear, :horrible])
  end

  @doc"""
  Does the planet have a life supporting atmosphere.
  """
  def life_supporting_atmosphere?() do
    Enum.random([:true, :false])
  end

  @doc"""
  What is the planet's ruling body posture towards outsiders.
  """
  def posture?() do
    Enum.random([:peaceful, :aggressive])
  end

  @doc"""
  What is the planet's ruling body posture towards aliens.
  """
  def xenophobic?() do
    Enum.random([:true, :false])
  end

  @doc"""
  Randomly set the planet's population.
  """
  def get_population() do
    Enum.random(
      [0,
       Enum.random(10_000..10_000_000),
       Enum.random(10_000_000..100_000_000),
       Enum.random(100_000_000..999_000_000),
       Enum.random(999_000_000..10_000_000_000),
       Enum.random(10_000_000_000..999_000_000_000)
      ]
    )
  end

  @doc"""
  Randomly set the amount of available natural resources.
  """
  def get_natural_resources() do
    Enum.random(
      [0,
       Enum.random(10_000..10_000_000),
       Enum.random(10_000_000..100_000_000),
       Enum.random(100_000_000..999_000_000),
       Enum.random(999_000_000..10_000_000_000),
       Enum.random(10_000_000_000..999_000_000_000)
      ]
    )
  end

  @doc"""
  Randomly set the amount of agricultural potential.
  """
  def get_agriculture() do
    Enum.random(
      [0,
       Enum.random(10_000..10_000_000),
       Enum.random(10_000_000..100_000_000),
       Enum.random(100_000_000..999_000_000),
       Enum.random(999_000_000..10_000_000_000),
       Enum.random(10_000_000_000..999_000_000_000)
      ]
    )
  end

  @doc"""
  Randomly choose whether the planet has a defense system.
  The strength is determined when a player interacts with it.
  """
  def defenses?() do
    Enum.random([:true, :false])
  end

  @doc"""
  Randomly choose whether the planet has a army.
  The strength is determined when a player interacts with it.
  """
  def army?() do
    Enum.random([:true, :false])
  end

  @doc"""
  Randomly choose whether the planet has a navy.
  The strength is determined when a player interacts with it.
  """
  def navy?() do
    Enum.random([:true, :false])
  end

  @doc"""
  Randomly choose whether the planet's ruling forces are open to diplomacy.
  """
  def get_diplomacy() do
    Enum.random([:true, :false])
  end

  @doc"""
  Randomly choose whether the planet has refilling stations.
  """
  def fuel?() do
    Enum.random([:true, :false])
  end  
end
