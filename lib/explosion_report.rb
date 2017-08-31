class ExplosionReport
  include Comparable
  attr :mine
  attr_accessor :explosion_counter

  def initialize(mine, explosion_counter: 0)
    @mine = mine
    @explosion_counter = explosion_counter
  end

  def <=>(object)
    explosion_counter <=> object.explosion_counter
  end
end
