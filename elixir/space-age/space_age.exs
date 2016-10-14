defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    case {planet} do
      {:earth} -> seconds / 31557600
      {:mercury} -> seconds / 0.2408467 / 31557600
      {:venus} -> seconds / 0.61519726 / 31557600
      {:mars} -> seconds / 1.8808158 / 31557600
      {:jupiter} -> seconds / 11.862615 / 31557600
      {:saturn} -> seconds / 29.447498 / 31557600
      {:neptune} -> seconds / 164.79132 / 31557600
      {:uranus} -> seconds / 84.016846 / 31557600
    end
  end
end
