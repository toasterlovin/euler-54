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
      false
      # return true if straight? && flush?
    end

    def straight?
      false
      # return unless card_rankings.uniq.count == 5

      # sorted_cards = card_rankings.sort
      # largest = sorted_cards.first
      # smallest = sorted_cards.first
    end

    def flush?
      card_suits.uniq.length == 1
    end

    def card_rankings
      @cards.map(&:ranking)
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

  class Flush < Hand
    def valid?
      flush?
    end
  end

  RANKED_HANDS = [
    Flush
  ]
end
