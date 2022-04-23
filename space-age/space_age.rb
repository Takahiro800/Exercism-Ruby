class SpaceAge
  EARTH_YEAR_SECONDS = 31_557_600

  ORBITAL_PERIODS_IN_EARTH_YEARS = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132,
  }

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL_PERIODS_IN_EARTH_YEARS.each do |planet, orbital_period|
    define_method('on_' + planet.to_s) { seconds.to_f / (EARTH_YEAR_SECONDS * orbital_period) }
  end
end
