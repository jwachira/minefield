class ExplosionCalculator
  attr :mines

  def initialize(mines)
    @mines = mines
  end

  def explode
    mines.map do |mine|
      mine.explode(mines)
    end.sort.reverse
  end
end
