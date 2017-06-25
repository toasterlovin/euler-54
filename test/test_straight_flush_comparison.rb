require 'minitest/autorun'
require 'poker'

class StraightFlushComparisonTest < Minitest::Test
  def test_straight_flush_comparison
    winner = Poker::HandFactory.hand('3S 4S 5S 6S 7S')
    assert_instance_of Poker::StraightFlush, winner

    loser = Poker::HandFactory.hand('2H 3H 4H 5H 6H')
    assert_instance_of Poker::StraightFlush, loser

    assert winner > loser
  end
end
