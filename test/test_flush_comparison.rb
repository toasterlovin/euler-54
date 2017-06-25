require 'minitest/autorun'
require 'poker'

class FlushComparisonTest < Minitest::Test
  def test_different_high_cards
    winner = Poker::HandFactory.hand('2H 3H 4H 5H 8H')
    assert_instance_of Poker::Flush, winner
    loser = Poker::HandFactory.hand('2S 3S 4S 5S 7S')
    assert_instance_of Poker::Flush, loser

    assert winner > loser
  end

  def test_same_high_cards
    winner = Poker::HandFactory.hand('3H 5H 6H 7H 8H')
    assert_instance_of Poker::Flush, winner
    loser = Poker::HandFactory.hand('2H 5H 6H 7H 8H')
    assert_instance_of Poker::Flush, loser

    assert winner > loser
  end
end
