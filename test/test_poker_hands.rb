require 'minitest/autorun'
require 'poker'

class PokerTest < Minitest::Test
  def test_dentifies_straight_flush
    flush = Poker::HandFactory.hand('2H 3H 4H 5H 7H')
    refute_instance_of Poker::StraightFlush, flush

    straight = Poker::HandFactory.hand('2H 3H 4H 5H 6S')
    refute_instance_of Poker::StraightFlush, straight

    straight_flush = Poker::HandFactory.hand('2H 3H 4H 5H 6H')
    assert_instance_of Poker::StraightFlush, straight_flush
  end

  def test_identifies_four_of_a_kind
    not_four_of_a_kind = Poker::HandFactory.hand('2S 2H 2D 3C 4S')
    refute_instance_of Poker::FourOfAKind, not_four_of_a_kind

    four_of_a_kind = Poker::HandFactory.hand('2S 2H 2D 2C 3S')
    assert_instance_of Poker::FourOfAKind, four_of_a_kind
  end

  def test_identifies_full_house
    not_full_house = Poker::HandFactory.hand('2S 2H 3D 3C 4S')
    refute_instance_of Poker::FullHouse, not_full_house

    full_house = Poker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of Poker::FullHouse, full_house
  end

  def test_identifies_flush
    not_flush = Poker::HandFactory.hand('2H 3H 4H 5H 6C')
    refute_instance_of Poker::Flush, not_flush

    flush = Poker::HandFactory.hand('2H 3H 4H 5H 7H')
    assert_instance_of Poker::Flush, flush
  end

  def test_identifies_straight
    not_straight = Poker::HandFactory.hand('2S 3H 4D 5C 5S')
    refute_instance_of Poker::Straight, not_straight

    straight = Poker::HandFactory.hand('2S 3H 4D 5C 6S')
    assert_instance_of Poker::Straight, straight
  end

  def test_identifies_three_of_a_kind
    not_three_of_a_kind = Poker::HandFactory.hand('2S 2H 2D 3C 3S')
    refute_instance_of Poker::ThreeOfAKind, not_three_of_a_kind

    three_of_a_kind = Poker::HandFactory.hand('2S 2H 2D 3C 4S')
    assert_instance_of Poker::ThreeOfAKind, three_of_a_kind
  end

  def test_identifies_two_pair
    not_two_pair = Poker::HandFactory.hand('2S 2H 3D 4C 5S')
    refute_instance_of Poker::TwoPair, not_two_pair

    two_pair = Poker::HandFactory.hand('2S 2H 3D 3C 4S')
    assert_instance_of Poker::TwoPair, two_pair
  end

  def test_identifies_one_pair
    not_one_pair = Poker::HandFactory.hand('2S 3H 4D 5C 7S')
    refute_instance_of Poker::OnePair, not_one_pair

    one_pair = Poker::HandFactory.hand('2S 2H 3D 4C 5S')
    assert_instance_of Poker::OnePair, one_pair
  end

  def test_identifies_high_card
    high_card = Poker::HandFactory.hand('2S 3H 4D 5C 7S')
    assert_instance_of Poker::HighCard, high_card
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
