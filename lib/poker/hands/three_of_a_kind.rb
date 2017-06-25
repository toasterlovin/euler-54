module Poker
  class ThreeOfAKind < Hand
    def <=>(other)
      return super unless super == 0

      if triplet_rank == other.triplet_rank
        return ranked_extra_cards <=> other.ranked_extra_cards
      else
        return triplet_rank <=> other.triplet_rank
      end
    end

    def triplet_rank
      rank_counts
        .find { |rank, count| count == 3 }
        .first
    end

    def ranked_extra_cards
      ranks
        .reject { |rank| rank == triplet_rank }
        .sort
        .reverse
    end

    def valid?
      three_of_a_kind?
    end
  end
end
