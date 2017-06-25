module Poker
  class HandFactory
    def self.hand(cards)
      RANKED_HANDS
        .map { |h| h.parse_hand(cards) }
        .find{ |h| h.valid? }
    end
  end

  class Hand
    include Comparable

    def self.parse_hand(hand)
      parse_cards(hand.split)
    end

    def self.parse_cards(cards)
      new(cards.map { |c| Card.new(c) })
    end

    def initialize(cards)
      @cards = cards
    end

    def <=>(other)
      rank <=> other.rank
    end

    def rank
      RANKED_HANDS.reverse.index(self.class)
    end

    def straight_flush?
      return true if straight? && flush?
    end

    def four_of_a_kind?
      rank_counts.values.any? { |count| count == 4 }
    end

    def full_house?
      rank_counts.values.include?(3) && rank_counts.values.include?(2)
    end

    def flush?
      suits.uniq.length == 1
    end

    def straight?
      # Can't be a straight unless all cards are different ranks
      return false unless ranks.uniq.count == 5

      sorted_cards = ranks.sort
      smallest = sorted_cards.first
      largest = sorted_cards.last

      # Since these are unique and sorted, if the difference between
      # largest and smallest is 4, then these are consecutive cards
      largest - smallest == 4
    end

    def three_of_a_kind?
      rank_counts.values.any? { |count| count == 3 }
    end

    def two_pair?
      rank_counts
        .values
        .select { |count| count == 2 }
        .count == 2
    end

    def one_pair?
      rank_counts.values.any? { |count| count == 2 }
    end

    def ranks
      @cards.map(&:rank)
    end

    def rank_counts
      ranks.reduce(Hash.new(0)) do |counts, rank|
        counts[rank] += 1
        counts
      end
    end

    def suits
      @cards.map(&:suit)
    end
  end

  class StraightFlush < Hand
    def valid?
      straight_flush?
    end
  end

  class FourOfAKind < Hand
    def valid?
      four_of_a_kind?
    end
  end

  class FullHouse < Hand
    def valid?
      full_house?
    end
  end

  class Flush < Hand
    def valid?
      flush?
    end
  end

  class Straight < Hand
    def valid?
      straight?
    end
  end

  class ThreeOfAKind < Hand
    def valid?
      three_of_a_kind?
    end
  end

  class TwoPair < Hand
    def valid?
      two_pair?
    end
  end

  class OnePair < Hand
    def valid?
      one_pair?
    end
  end

  class HighCard < Hand
    def valid?
      true
    end
  end

  RANKED_HANDS = [
    StraightFlush,
    FourOfAKind,
    FullHouse,
    Flush,
    Straight,
    ThreeOfAKind,
    TwoPair,
    OnePair,
    HighCard
  ]
end
