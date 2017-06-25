require 'minitest/autorun'
require 'poker'

class FourOfAKindComparisonTest < Minitest::Test
  def test_four_of_a_kind_comparison
    winner = Poker::HandFactory.hand('3S 3H 3D 3C 4S')
    assert_instance_of Poker::FourOfAKind, winner

    loser = Poker::HandFactory.hand('2S 2H 2D 2C 3S')
    assert_instance_of Poker::FourOfAKind, loser

    assert winner > loser
  end
end
