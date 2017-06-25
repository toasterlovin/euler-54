Dir[File.dirname(__FILE__) + '/hands/*.rb'].each { |file| require file }

module Poker
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

  class HandFactory
    def self.hand(hand)
      cards = parse_cards(hand)
      build_hand(cards)
    end

    def self.parse_cards(cards_string)
      cards_string
        .split
        .map { |card_string| Card.new(card_string) }
    end

    def self.build_hand(cards)
      RANKED_HANDS
        .map { |h| h.new(cards) }
        .find{ |h| h.valid? }
    end
  end
end
