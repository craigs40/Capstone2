# frozen_string_literal: true

# checking errors
class CheckError
  attr_accessor :number_of_errors

  def initialize
    @number_of_errors = []
    @operator = ['+', '-', '>', '<', '!', '*', '=']
  end

  def trailing_white_space
    File.foreach('./test_file.txt') do |str|
      @number_of_errors << ['Line ends with trailing white space.'] if !str.strip.empty? && str[-2] == ' '
    end
  end

  def empty_line_extra
    File.foreach('./test_file.txt') do |str|
      @number_of_errors << ['Extra empty line detected.'] if str.strip.empty?
    end
  end

  def space_around_operator
    File.foreach('./test_file.txt') do
      unless @operator.to_s.start_with?(' ') && @operator.end_with?(' ')
        @number_of_errors << ['Add space around operators.']
      end
    end
  end

  def indent
    File.foreach('./test_file.txt') do |str|
      @number_of_errors << ['Line should be indented.'] unless str.start_with?('class', 'module')
    end
  end

  def empty_line_end
    File.foreach('./test_file.txt') do |str|
      @number_of_errors << ['Add empty line after end keyword.'] if str.start_with?('end')
    end
  end
end
