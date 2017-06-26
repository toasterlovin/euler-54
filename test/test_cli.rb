require 'minitest/autorun'
require 'pty'

class CLITest < Minitest::Test
  def test_file_evaluation
    PTY.spawn('bin/euler_poker test/files/poker.txt') do |output, input, pid|
      assert_equal 'First hand won 1 times', output.gets.chomp
      assert_equal 'Second hand won 1 times', output.gets.chomp
    end
  end
end
