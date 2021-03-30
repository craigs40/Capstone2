require_relative '../lib/check_error'

RSpec.describe CheckError do
  let(:check_error) { CheckError.new('test_errors.txt') }
  context '#trailing_white_space' do
    it 'detects trailing white space' do
      expect(check_error.trailing_white_space).to eq(nil)
    end
  end

  context '#empty_line_extra' do
    it 'detects an extra empty line' do
      expect(check_error.empty_line_extra).to eq(nil)
    end
  end

  context '#space_around_operator' do
    it 'detects space around operators' do
      expect(check_error.space_around_operator).to eq(nil)
    end
  end

  context '#indent' do
    it 'detects indentation' do
      expect(check_error.indent).to eq(nil)
    end
  end

  context '#empty_line_end' do
    it 'detects empty lines following the end keyword' do
      expect(check_error.empty_line_end).to eq(nil)
    end
  end
end
