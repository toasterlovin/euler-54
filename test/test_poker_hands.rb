require 'minitest/autorun'
require 'poker'

class PokerTest < Minitest::Test
  def test_identifies_flush
    not_flush = Poker::HandFactory.hand('2H 3H 4H 5H 6C')
    refute_instance_of Poker::Flush, not_flush
    flush = Poker::HandFactory.hand('2H 3H 4H 5H 7H')
    assert_instance_of Poker::Flush, flush
  end

  def test_straight_flush_vs_four_of_kind
    flunk
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
