defmodule SpaceAge do
	@type planet :: :mercury | :venus | :earth | :mars | :jupiter
	| :saturn | :neptune | :uranus


  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds) do
  	seconds / (60 * 60 * 24 * 365.25)
  end

  @spec age_on(planet, pos_integer) :: float
  def age_on(:mercury, seconds) do
  	age_on(:earth, seconds) / 0.2408467
  end

  @spec age_on(planet, pos_integer) :: float
  def age_on(:venus, seconds) do
  	age_on(:earth, seconds) / 0.61519726
  end

  @spec age_on(planet, pos_integer) :: float
  def age_on(:mars, seconds) do
  	age_on(:earth, seconds) / 1.8808158
  end

  @spec age_on(planet, pos_integer) :: float
  def age_on(:jupiter, seconds) do
  	age_on(:earth, seconds) / 11.862615
  end

  @spec age_on(planet, pos_integer) :: float
  def age_on(:saturn, seconds) do
  	age_on(:earth, seconds) / 29.447498
  end

  @spec age_on(planet, pos_integer) :: float
  def age_on(:uranus, seconds) do
  	age_on(:earth, seconds) / 84.016846
  end

  @spec age_on(planet, pos_integer) :: float
  def age_on(:neptune, seconds) do
  	age_on(:earth, seconds) / 164.79132
  end
end