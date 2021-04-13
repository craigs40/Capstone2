# checking error
class CheckError
  attr_reader :number_of_errors

  def initialize
    $number_of_errors = []
    @file = File.foreach('../test_file.txt')
  end

  def trailing_white_space
    @file.each_with_index do |str, index|
      if !str.strip.empty? && str[-2] == ' '
        $number_of_errors << ["Line #{index + 1} ends with trailing white space."]
      end
    end
  end

  def empty_line_extra
    @file.with_index do |str, index|
      if str.strip.empty?
        $number_of_errors << ["Line #{index + 1}: Extra empty line detected."]
      end
    end
  end

  def space_around_operator
    @file.with_index do |str, index|
      if str.include?('=')
        $number_of_errors << ["Line #{index + 1}: Add space around operators."]
      end
    end
  end

  def indent
    @file.each_with_index do |str, index|
      next if str.strip.empty?

      unless str.start_with?('class', 'module', 'end') || str.start_with?('  ')
        $number_of_errors << ["Line #{index + 1} should be indented."]
      end
    end
  end

  def empty_line_end
    @file.with_index do |str, index|
      if str.start_with?('end')
        $number_of_errors << ["Line #{index + 1}: Add empty line after end keyword."]
      end
    end
  end
end
