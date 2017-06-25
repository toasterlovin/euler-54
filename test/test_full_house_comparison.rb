require 'minitest/autorun'
require 'poker'

class FullHouseComparisonTest < Minitest::Test
  def test_triplets_of_different_rank
    winner = Poker::HandFactory.hand('3S 3H 3D 4C 4S')
    assert_instance_of Poker::FullHouse, winner
    loser = Poker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of Poker::FullHouse, loser

    assert winner > loser
  end

  def test_triplets_of_same_rank
    winner = Poker::HandFactory.hand('2S 2H 2D 4C 4S')
    assert_instance_of Poker::FullHouse, winner
    loser = Poker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of Poker::FullHouse, loser

    assert winner > loser
  end
end
