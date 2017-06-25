require 'minitest/autorun'
require 'euler_poker'

class StraightComparisonTest < Minitest::Test
  def test_straight_comparison
    winner = EulerPoker::HandFactory.hand('3H 4D 5C 6S 7S')
    assert_instance_of EulerPoker::Straight, winner
    loser = EulerPoker::HandFactory.hand('2S 3H 4D 5C 6S')
    assert_instance_of EulerPoker::Straight, loser

    assert winner > loser
  end
end
