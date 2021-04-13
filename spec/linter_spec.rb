require_relative '../lib/check_error'
# rubocop:disable Metrics/BlockLength
RSpec.describe CheckError do
  let(:checking) { CheckError.new }

  describe '#trailing_white_space' do
    it 'returns trailing space error' do
      checking.trailing_white_space
      expect(checking.number_of_errors[0]).to eq(['Line 1 ends with trailing white space.'])
    end
  end

  describe 'empty_line_extra' do
    it 'returns extra empty line error' do
      checking.empty_line_extra
      expect(checking.number_of_errors[0]).to eq(['Line 2: Extra empty line detected.'])
    end
  end

  describe '#space_around_operator' do
    it 'returns space around operator error' do
      checking.space_around_operator
      expect(checking.number_of_errors[0]).to eq(['Line 5: Add space around operators.'])
    end
  end

  describe '#indent' do
    it 'returns indent error' do
      checking.indent
      expect(checking.number_of_errors[0]).to eq(['Line 4 should be indented.'])
    end
  end

  describe '#empty_line_end' do
    it 'returns error if there is no empty line after end' do
      checking.empty_line_end
      expect(checking.number_of_errors[0]).to eq(['Line 8: Add empty line after end keyword.'])
    end
  end
end
# rubocop:enable Metrics/BlockLength
