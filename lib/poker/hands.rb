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
      return false unless card_rankings.uniq.count == 5

      sorted_cards = card_rankings.sort
      puts "Sorted Cards: #{sorted_cards}"
      smallest = sorted_cards.first
      largest = sorted_cards.last

      largest - smallest == 4
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

  class Straight < Hand
    def valid?
      straight?
    end
  end

  RANKED_HANDS = [
    Flush,
    Straight
  ]
end
