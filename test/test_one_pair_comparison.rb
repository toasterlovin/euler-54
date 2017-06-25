require 'minitest/autorun'
require 'poker'

class OnePairComparisonTest < Minitest::Test
  def test_pairs_of_different_rank
    winner = Poker::HandFactory.hand('3S 3H 6D 5C 4S')
    assert_instance_of Poker::OnePair, winner
    loser = Poker::HandFactory.hand('2S 2H 5D 4C 3S')
    assert_instance_of Poker::OnePair, loser

    assert winner > loser
  end

  def test_pairs_of_same_rank
    winner = Poker::HandFactory.hand('2S 2H 6D 5C 4S')
    assert_instance_of Poker::OnePair, winner
    loser = Poker::HandFactory.hand('2S 2H 5D 4C 3S')
    assert_instance_of Poker::OnePair, loser

    assert winner > loser
  end
end
