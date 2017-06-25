require 'minitest/autorun'
require 'euler_poker'

class RoundTest < Minitest::Test
  def test_round_evaluation
    first_wins = EulerPoker::Round.new('2H 3H 4H 5H 6H 2S 2H 2D 2C 3S')
    assert_equal :first, first_wins.winner

    second_wins = EulerPoker::Round.new('2S 2H 2D 2C 3S 2H 3H 4H 5H 6H')
    assert_equal :second, second_wins.winner
  end
end
