require 'minitest/autorun'
require 'poker'

class PokerTest < Minitest::Test
  def test_dentifies_straight_flushes
    not_straight = Poker::HandFactory.hand('2S 3H 4D 5C 5S')
    refute_instance_of Poker::Straight, not_straight
    straight = Poker::HandFactory.hand('2S 3H 4D 5C 6S')
    assert_instance_of Poker::Straight, straight
  end

  def test_identifies_flush
    not_flush = Poker::HandFactory.hand('2H 3H 4H 5H 6C')
    refute_instance_of Poker::Flush, not_flush
    flush = Poker::HandFactory.hand('2H 3H 4H 5H 7H')
    assert_instance_of Poker::Flush, flush
  end

  def test_identifies_straight
    flush = Poker::HandFactory.hand('2H 3H 4H 5H 7H')
    refute_instance_of Poker::StraightFlush, flush
    straight = Poker::HandFactory.hand('2H 3H 4H 5H 6S')
    refute_instance_of Poker::StraightFlush, straight
    straight_flush = Poker::HandFactory.hand('2H 3H 4H 5H 6H')
    assert_instance_of Poker::StraightFlush, straight_flush
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
