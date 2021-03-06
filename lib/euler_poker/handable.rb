module EulerPoker
  module Handable
    include Comparable

    def initialize(cards)
      @cards = cards
    end

    def <=>(other)
      class_result = class_comparison(other)
      return class_result unless class_result == 0

      return instance_comparison(other)
    end

    def ranking
      RANKED_HANDS.reverse.index(self.class)
    end

    def class_comparison(other)
      ranking <=> other.ranking
    end

    def ranks
      @cards.map(&:rank)
    end

    def suits
      @cards.map(&:suit)
    end

    def descending_ranks
      ranks.sort.reverse
    end

    private

    def rank_counts
      ranks.reduce(Hash.new(0)) do |counts, rank|
        counts[rank] += 1
        counts
      end
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
  end
end
