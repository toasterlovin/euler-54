require 'minitest/autorun'
require 'poker'

class ThreeOfAKindComparisonTest < Minitest::Test
  def test_triplets_of_different_rank
    winner = Poker::HandFactory.hand('3S 3H 3D 4C 5S')
    assert_instance_of Poker::ThreeOfAKind, winner
    loser = Poker::HandFactory.hand('2S 2H 2D 4C 5S')
    assert_instance_of Poker::ThreeOfAKind, loser

    assert winner > loser
  end

  def test_triplets_of_same_rank
    winner = Poker::HandFactory.hand('2S 2H 2D 5C 3S')
    assert_instance_of Poker::ThreeOfAKind, winner
    loser = Poker::HandFactory.hand('2S 2H 2D 4C 3S')
    assert_instance_of Poker::ThreeOfAKind, loser

    assert winner > loser
  end
end
