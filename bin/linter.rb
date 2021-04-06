# !/usr/bin/env ruby

require_relative '../lib/check_error'

checking = CheckError.new
checking.trailing_white_space
checking.empty_line_extra
checking.space_around_operator
checking.indent
checking.empty_line_end

if @number_of_errors.nil?
  puts 'no errors'
else
  puts @number_of_errors
end
