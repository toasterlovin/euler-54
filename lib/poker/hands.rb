module Poker
  class HandFactory
    def self.hand(cards)
      RANKED_HANDS
        .map { |h| h.parse_hand(cards) }
        .find{ |h| h.valid? }
    end
  end

  class Hand
    def self.parse_hand(hand)
      parse_cards(hand.split)
    end

    def self.parse_cards(cards)
      new(cards.map { |c| Card.new(c) })
    end

    def initialize(cards)
      @cards = cards
    end

    def straight_flush?
      return true if straight? && flush?
    end

    def four_of_a_kind?
      counts = Hash.new(0)
      ranks.each { |rank| counts[rank] += 1 }

      counts.values.any? { |count| count == 4 }
    end

    def flush?
      card_suits.uniq.length == 1
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

    def ranks
      @cards.map(&:rank)
    end

    def card_suits
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

  RANKED_HANDS = [
    StraightFlush,
    FourOfAKind,
    Flush,
    Straight
  ]
end
