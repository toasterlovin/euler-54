require 'minitest/autorun'
require 'euler_poker'

class HandIdentificationTest < Minitest::Test
  def test_dentifies_straight_flush
    flush = EulerPoker::HandFactory.hand('2H 3H 4H 5H 7H')
    refute_instance_of EulerPoker::StraightFlush, flush

    straight = EulerPoker::HandFactory.hand('2H 3H 4H 5H 6S')
    refute_instance_of EulerPoker::StraightFlush, straight

    straight_flush = EulerPoker::HandFactory.hand('2H 3H 4H 5H 6H')
    assert_instance_of EulerPoker::StraightFlush, straight_flush
  end

  def test_identifies_four_of_a_kind
    not_four_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 3C 4S')
    refute_instance_of EulerPoker::FourOfAKind, not_four_of_a_kind

    four_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 2C 3S')
    assert_instance_of EulerPoker::FourOfAKind, four_of_a_kind
  end

  def test_identifies_full_house
    not_full_house = EulerPoker::HandFactory.hand('2S 2H 3D 3C 4S')
    refute_instance_of EulerPoker::FullHouse, not_full_house

    full_house = EulerPoker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of EulerPoker::FullHouse, full_house
  end

  def test_identifies_flush
    not_flush = EulerPoker::HandFactory.hand('2H 3H 4H 5H 6C')
    refute_instance_of EulerPoker::Flush, not_flush

    flush = EulerPoker::HandFactory.hand('2H 3H 4H 5H 7H')
    assert_instance_of EulerPoker::Flush, flush
  end

  def test_identifies_straight
    not_straight = EulerPoker::HandFactory.hand('2S 3H 4D 5C 5S')
    refute_instance_of EulerPoker::Straight, not_straight

    straight = EulerPoker::HandFactory.hand('2S 3H 4D 5C 6S')
    assert_instance_of EulerPoker::Straight, straight
  end

  def test_identifies_three_of_a_kind
    not_three_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 3C 3S')
    refute_instance_of EulerPoker::ThreeOfAKind, not_three_of_a_kind

    three_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 3C 4S')
    assert_instance_of EulerPoker::ThreeOfAKind, three_of_a_kind
  end

  def test_identifies_two_pair
    not_two_pair = EulerPoker::HandFactory.hand('2S 2H 3D 4C 5S')
    refute_instance_of EulerPoker::TwoPair, not_two_pair

    two_pair = EulerPoker::HandFactory.hand('2S 2H 3D 3C 4S')
    assert_instance_of EulerPoker::TwoPair, two_pair
  end

  def test_identifies_one_pair
    not_one_pair = EulerPoker::HandFactory.hand('2S 3H 4D 5C 7S')
    refute_instance_of EulerPoker::OnePair, not_one_pair

    one_pair = EulerPoker::HandFactory.hand('2S 2H 3D 4C 5S')
    assert_instance_of EulerPoker::OnePair, one_pair
  end

  def test_identifies_high_card
    high_card = EulerPoker::HandFactory.hand('2S 3H 4D 5C 7S')
    assert_instance_of EulerPoker::HighCard, high_card
  end
end
