require 'minitest/autorun'
require 'euler_poker'

class FullHouseComparisonTest < Minitest::Test
  def test_triplets_of_different_rank
    winner = EulerPoker::HandFactory.hand('3S 3H 3D 4C 4S')
    assert_instance_of EulerPoker::FullHouse, winner
    loser = EulerPoker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of EulerPoker::FullHouse, loser

    assert winner > loser
  end

  def test_triplets_of_same_rank
    winner = EulerPoker::HandFactory.hand('2S 2H 2D 4C 4S')
    assert_instance_of EulerPoker::FullHouse, winner
    loser = EulerPoker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of EulerPoker::FullHouse, loser

    assert winner > loser
  end
end
