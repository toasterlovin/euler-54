require 'minitest/autorun'
require 'euler_poker'

class OnePairComparisonTest < Minitest::Test
  def test_pairs_of_different_rank
    winner = EulerPoker::HandFactory.hand('3S 3H 6D 5C 4S')
    assert_instance_of EulerPoker::OnePair, winner
    loser = EulerPoker::HandFactory.hand('2S 2H 5D 4C 3S')
    assert_instance_of EulerPoker::OnePair, loser

    assert winner > loser
  end

  def test_pairs_of_same_rank
    winner = EulerPoker::HandFactory.hand('2S 2H 6D 5C 4S')
    assert_instance_of EulerPoker::OnePair, winner
    loser = EulerPoker::HandFactory.hand('2S 2H 5D 4C 3S')
    assert_instance_of EulerPoker::OnePair, loser

    assert winner > loser
  end
end
