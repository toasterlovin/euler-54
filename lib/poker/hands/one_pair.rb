module Poker
  class OnePair < Hand
    def <=>(other)
      return super unless super == 0

      if pair_rank != other.pair_rank
        pair_rank <=> other.pair_rank
      else
        ranked_extra_cards <=> other.ranked_extra_cards
      end
    end

    def pair_rank
      rank_counts
        .find { |rank, count| count == 2 }
        .first
    end

    def ranked_extra_cards
      ranks
        .reject { |rank| rank == pair_rank }
        .sort
        .reverse
    end

    def valid?
      one_pair?
    end
  end
end
