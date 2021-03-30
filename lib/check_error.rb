class CheckError
  def trailing_white_space
    number_of_errors << ['Line ends with trailing white space.'] if line.end_with?(' ')
  end

  def empty_line_extra
    number_of_errors << ['Extra empty line detected.'] if line == '' && line[index - 1] == ''
  end

  def space_around_operator
    operator = ['+', '-', '>', '<', '!', '*', '=']
    number_of_errors << ['Add space around operators.'] unless operator.start_with?(' ') && operator.end_with?(' ')
  end

  def indent
    number_of_errors << ['Line should be indented.'] unless line.start_with?('class', 'def', 'end')
  end

  def empty_line_end
    number_of_errors << ['Add empty line after end keyword.'] if line.end_with?('end')
  end
end
