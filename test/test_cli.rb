require 'minitest/autorun'
require 'pty'

class CLITest < Minitest::Test
  def test_file_evaluation
    PTY.spawn('bin/euler_poker test/files/poker.txt') do |output, input, pid|
      assert_equal 'Player 1 won 1 out of 2 hands.', output.gets.chomp
    end
  end
end
