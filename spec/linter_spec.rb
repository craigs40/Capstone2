require_relative '../lib/check_error'
require_relative '../bin/linter'

RSpec.describe CheckError do
  describe '#trailing_white_space' do
    it 'detects trailing white space' do
      str = ' string'
      expect(str.chars[0]).to eq(' ')
    end
  end

  describe '#empty_line_extra' do
    it 'detects an extra empty line' do
      line = ''
      expect(line.empty?).to eq(true)
    end
  end

  describe '#space_around_operator' do
    it 'detects space around operators' do
      str = '1 + 2'
      expect(str.chars[1, 3]).to eq([' ', '+', ' '])
    end
  end

  describe '#indent' do
    it 'detects indentation' do
      str = ' if'
      expect(str.chars[0]).to eq(' ')
    end
  end

  describe '#empty_line_end' do
    it 'detects empty lines following the end keyword' do
      line = ''
      expect(line.empty?).to eq(true)
    end
  end
end
