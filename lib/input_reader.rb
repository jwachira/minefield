require 'pry'
class InputReader
  class FileDoesNotExist < Exception; end

  attr :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read
    return fail FileDoesNotExist, 'File path provided does not exist.' unless File.exist?(file_path)
    File.readlines(file_path).map do |line|
      line.split(' ').map(&:to_i)
    end
  end
end
