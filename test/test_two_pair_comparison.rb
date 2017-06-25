require 'minitest/autorun'
require 'poker'

class TwoPairComparisonTest < Minitest::Test
  def test_high_pair_of_different_rank
    winner = Poker::HandFactory.hand('4S 4H 2D 2C 5S')
    assert_instance_of Poker::TwoPair, winner
    loser = Poker::HandFactory.hand('3S 3H 2D 2C 5S')
    assert_instance_of Poker::TwoPair, loser

    assert winner > loser
  end

  def test_same_high_pair_rank_different_low_pair_rank
    winner = Poker::HandFactory.hand('4S 4H 3D 3C 5S')
    assert_instance_of Poker::TwoPair, winner
    loser = Poker::HandFactory.hand('4S 4H 2D 2C 5S')
    assert_instance_of Poker::TwoPair, loser

    assert winner > loser
  end

  def test_same_high_and_low_pair_ranks
    winner = Poker::HandFactory.hand('4S 4H 3D 3C 6S')
    assert_instance_of Poker::TwoPair, winner
    loser = Poker::HandFactory.hand('4S 4H 3D 3C 5S')
    assert_instance_of Poker::TwoPair, loser

    assert winner > loser
  end
end
