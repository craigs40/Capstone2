# frozen_string_literal: true

require_relative '../lib/check_error'
# rubocop:disable Metrics/BlockLength
RSpec.describe CheckError do
  let(:checking) { CheckError.new }

  describe '#trailing_white_space' do
    it 'detects trailing white space' do
      str = ' string'
      expect(str.chars[0]).to eq(' ')
    end
    it 'returns trailing space error' do
      checking.trailing_white_space
      expect(checking.number_of_errors[0]).to eq(['Line ends with trailing white space.'])
    end
  end

  describe 'empty_line_extra' do
    it 'detects an extra empty line' do
      line = ''
      expect(line.empty?).to eq(true)
    end
    it 'returns extra empty line error' do
      checking.empty_line_extra
      expect(checking.number_of_errors[0]).to eq(['Extra empty line detected.'])
    end
  end

  describe '#space_around_operator' do
    it 'detects space around operators' do
      str = '1 + 2'
      expect(str.chars[1, 3]).to eq([' ', '+', ' '])
    end
    it 'returns space around operator error' do
      checking.space_around_operator
      expect(checking.number_of_errors[0]).to eq(['Add space around operators.'])
    end
  end

  describe '#indent' do
    it 'detects indentation' do
      str = ' if'
      expect(str.chars[0]).to eq(' ')
    end
    it 'returns indent error' do
      checking.indent
      expect(checking.number_of_errors[0]).to eq(['Line should be indented.'])
    end
  end

  describe '#empty_line_end' do
    it 'detects empty lines following the end keyword' do
      line = ''
      expect(line.empty?).to eq(true)
    end
    it 'returns error if there is no empty line after end' do
      checking.empty_line_end
      expect(checking.number_of_errors[0]).to eq(['Add empty line after end keyword.'])
    end
  end
end
# rubocop:enable Metrics/BlockLength
