require 'minitest/autorun'
require 'euler_poker'

class HighCardComparisonTest < Minitest::Test
  def test_high_card_of_different_rank
    winner = EulerPoker::HandFactory.hand('8S 7H 6D 5C 3S')
    assert_instance_of EulerPoker::HighCard, winner
    loser = EulerPoker::HandFactory.hand('7H 6D 5C 4S 2S')
    assert_instance_of EulerPoker::HighCard, loser

    assert winner > loser
  end

  def test_high_card_of_same_rank
    winner = EulerPoker::HandFactory.hand('8S 7H 6D 5C 3S')
    assert_instance_of EulerPoker::HighCard, winner
    loser = EulerPoker::HandFactory.hand('8S 7H 6D 5C 2S')
    assert_instance_of EulerPoker::HighCard, loser

    assert winner > loser
  end
end
