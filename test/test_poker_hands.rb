require 'minitest/autorun'
require 'poker'

class PokerTest < Minitest::Test
  def test_straight_flush_vs_four_of_kind
    winner = Poker::Judge.new('2H 3H 4H 5H 6H 7S 7H 7D 7C 8C').winner
    assert_equal :first, winner
  end

  def test_not_enough_cards
    flunk
  end

  def test_too_many_cards
    flunk
  end

  def test_duplicate_cards
    flunk
  end

  def test_invalid_cards
    flunk
  end
end
