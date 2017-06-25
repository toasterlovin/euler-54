require 'minitest/autorun'
require 'poker'

class StraightComparisonTest < Minitest::Test
  def test_straight_comparison
    winner = Poker::HandFactory.hand('3H 4D 5C 6S 7S')
    assert_instance_of Poker::Straight, winner
    loser = Poker::HandFactory.hand('2S 3H 4D 5C 6S')
    assert_instance_of Poker::Straight, loser

    assert winner > loser
  end
end
