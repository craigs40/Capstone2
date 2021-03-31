# !/usr/bin/env ruby

require_relative '../lib/check_error'

number_of_errors = []
no_errors = number_of_errors.nil?

if no_errors
  puts "\n0 errors"
else
  puts "\n#{number_of_errors.each} errors"
end
