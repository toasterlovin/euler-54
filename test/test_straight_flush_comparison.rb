require 'minitest/autorun'
require 'euler_poker'

class StraightFlushComparisonTest < Minitest::Test
  def test_straight_flush_comparison
    winner = EulerPoker::HandFactory.hand('3S 4S 5S 6S 7S')
    assert_instance_of EulerPoker::StraightFlush, winner

    loser = EulerPoker::HandFactory.hand('2H 3H 4H 5H 6H')
    assert_instance_of EulerPoker::StraightFlush, loser

    assert winner > loser
  end
end
