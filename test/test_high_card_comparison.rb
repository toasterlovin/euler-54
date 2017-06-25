require 'minitest/autorun'
require 'poker'

class HighCardComparisonTest < Minitest::Test
  def test_high_card_of_different_rank
    winner = Poker::HandFactory.hand('8S 7H 6D 5C 3S')
    assert_instance_of Poker::HighCard, winner
    loser = Poker::HandFactory.hand('7H 6D 5C 4S 2S')
    assert_instance_of Poker::HighCard, loser

    assert winner > loser
  end

  def test_high_card_of_same_rank
    winner = Poker::HandFactory.hand('8S 7H 6D 5C 3S')
    assert_instance_of Poker::HighCard, winner
    loser = Poker::HandFactory.hand('8S 7H 6D 5C 2S')
    assert_instance_of Poker::HighCard, loser

    assert winner > loser
  end
end
