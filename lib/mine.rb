class Mine
  attr_accessor :x_coordinate, :y_coordinate, :radius

  def initialize(x_coordinate, y_coordinate, radius)
    @radius       = radius
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    fail ArgumentError.new("arguments must be an integer or float: #{to_s}") unless valid?
  end

  def to_s
    format('%s,%s,%s', x_coordinate, y_coordinate, radius)
  end

  def coordinates
    [x_coordinate, y_coordinate]
  end

  def within_radius?(mine)
    euclidean_distance(mine) <= radius
  end

  def euclidean_distance(mine)
    Math.sqrt(coordinates.zip(mine.coordinates).map { |a, b| a - b }
                         .map { |d| d * d }.reduce(:+))
  end

  def explode(mines)
    pending_explosion = mines - [self]
    explosion_data([self], pending_explosion, ExplosionReport.new(self))
  end

  private

  def explosion_data(exploding_mines, pending_explosion, report)
    new_exploding_mines, new_pending_explosion = pending_explosion.partition do |pe|
      exploding_mines.any? do |em|
        em.within_radius?(pe) ? report.explosion_counter += 1 : false
      end
    end

    return explosion_data(new_exploding_mines,
                          new_pending_explosion,
                          report) unless new_exploding_mines.empty?

    report
  end

  def valid?
    [x_coordinate, y_coordinate, radius].each do |argument|
      return false unless argument.is_a?(Numeric)
    end
    true
  end
end
