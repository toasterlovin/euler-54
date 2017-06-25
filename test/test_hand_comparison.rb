require 'minitest/autorun'
require 'euler_poker'

class HandComparisonTest < Minitest::Test
  def test_straight_flush_vs_four_of_kind
    straight_flush = EulerPoker::HandFactory.hand('2H 3H 4H 5H 6H')
    assert_instance_of EulerPoker::StraightFlush, straight_flush

    four_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 2C 3S')
    assert_instance_of EulerPoker::FourOfAKind, four_of_a_kind

    assert straight_flush > four_of_a_kind
  end

  def test_four_of_a_kind_vs_full_house
    four_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 2C 3S')
    assert_instance_of EulerPoker::FourOfAKind, four_of_a_kind

    full_house = EulerPoker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of EulerPoker::FullHouse, full_house

    assert four_of_a_kind > full_house
  end

  def test_full_house_vs_flush
    full_house = EulerPoker::HandFactory.hand('2S 2H 2D 3C 3S')
    assert_instance_of EulerPoker::FullHouse, full_house

    flush = EulerPoker::HandFactory.hand('2H 3H 4H 5H 7H')
    assert_instance_of EulerPoker::Flush, flush

    assert full_house > flush
  end

  def test_flush_vs_straight
    flush = EulerPoker::HandFactory.hand('2H 3H 4H 5H 7H')
    assert_instance_of EulerPoker::Flush, flush

    straight = EulerPoker::HandFactory.hand('2S 3H 4D 5C 6S')
    assert_instance_of EulerPoker::Straight, straight

    assert flush > straight
  end

  def test_straight_vs_three_of_a_kind
    straight = EulerPoker::HandFactory.hand('2S 3H 4D 5C 6S')
    assert_instance_of EulerPoker::Straight, straight

    three_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 3C 4S')
    assert_instance_of EulerPoker::ThreeOfAKind, three_of_a_kind

    assert straight > three_of_a_kind
  end

  def test_three_of_a_kind_vs_two_pair
    three_of_a_kind = EulerPoker::HandFactory.hand('2S 2H 2D 3C 4S')
    assert_instance_of EulerPoker::ThreeOfAKind, three_of_a_kind

    two_pair = EulerPoker::HandFactory.hand('2S 2H 3D 3C 4S')
    assert_instance_of EulerPoker::TwoPair, two_pair

    assert three_of_a_kind > two_pair
  end

  def test_two_pair_vs_one_pair
    two_pair = EulerPoker::HandFactory.hand('2S 2H 3D 3C 4S')
    assert_instance_of EulerPoker::TwoPair, two_pair

    one_pair = EulerPoker::HandFactory.hand('2S 2H 3D 4C 5S')
    assert_instance_of EulerPoker::OnePair, one_pair

    assert two_pair > one_pair
  end

  def test_one_pair_vs_high_card
    one_pair = EulerPoker::HandFactory.hand('2S 2H 3D 4C 5S')
    assert_instance_of EulerPoker::OnePair, one_pair

    high_card = EulerPoker::HandFactory.hand('2S 3H 4D 5C 7S')
    assert_instance_of EulerPoker::HighCard, high_card

    assert one_pair > high_card
  end
end
