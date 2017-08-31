class CLI
  def call
    input_path  = ARGV.shift || './input.txt'
    output_path = ARGV.shift || './output.txt'

    mine_coordinates = InputReader.new(input_path).read

    mines   = mine_coordinates.map do |coordinates|
                Mine.new(*coordinates)
              end

    results = ExplosionCalculator.new(mines).explode

    File.open(output_path, 'w') do |file|
      file.write "Mine | Explosion Counter\n"

      results.each do |result|
        file.write format("%s | %s\n", result.mine.to_s, result.explosion_counter)
      end
    end
  end
end
