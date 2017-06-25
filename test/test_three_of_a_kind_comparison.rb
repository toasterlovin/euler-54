require 'minitest/autorun'
require 'euler_poker'

class ThreeOfAKindComparisonTest < Minitest::Test
  def test_triplets_of_different_rank
    winner = EulerPoker::HandFactory.hand('3S 3H 3D 4C 5S')
    assert_instance_of EulerPoker::ThreeOfAKind, winner
    loser = EulerPoker::HandFactory.hand('2S 2H 2D 4C 5S')
    assert_instance_of EulerPoker::ThreeOfAKind, loser

    assert winner > loser
  end

  def test_triplets_of_same_rank
    winner = EulerPoker::HandFactory.hand('2S 2H 2D 5C 3S')
    assert_instance_of EulerPoker::ThreeOfAKind, winner
    loser = EulerPoker::HandFactory.hand('2S 2H 2D 4C 3S')
    assert_instance_of EulerPoker::ThreeOfAKind, loser

    assert winner > loser
  end
end
