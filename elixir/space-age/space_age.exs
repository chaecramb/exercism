defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @orbital_coefficient %{
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  # def convert(planet, seconds) do
  #   case planet do
  #     :mercury -> seconds / 0.2408467
  #     :venus -> seconds / 0.61519726
  #     :mars -> seconds / 1.8808158
  #     :jupiter -> seconds / 11.862615
  #     :saturn -> seconds / 29.447498
  #     :uranus -> seconds / 84.016846
  #     :neptune -> seconds / 164.79132
  #   end    
  # end

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds), do: seconds / 31557600
  def age_on(planet, seconds), do: age_on(:earth, seconds) / @orbital_coefficient[planet]
end
