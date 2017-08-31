class CLI
  def call
    input_path  = ARGV.shift || './input.txt'
    output_path = ARGV.shift || './output.txt'

    puts "Importing mine cordinates from #{input_path}".freeze
    mine_coordinates = InputReader.new(input_path).read

    puts "Creating mine entries....".freeze
    mines   = mine_coordinates.map do |coordinates|
                Mine.new(*coordinates)
              end

    puts "Explode those mines!!!".freeze
    results = ExplosionCalculator.new(mines).explode

    puts "Write explosion counters into a file...".freeze
    File.open(output_path, 'w') do |file|
      file.write "Mine | Explosion Counter\n"

      results.each do |result|
        file.write format("%s | %s\n", result.mine.to_s, result.explosion_counter)
      end
    end

    puts "Done! You can find the explosion report at #{output_path}"
  end
end
