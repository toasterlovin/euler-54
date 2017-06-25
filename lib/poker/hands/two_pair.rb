module Poker
  class TwoPair < Hand
    def <=>(other)
      return super unless super == 0

      if high_pair_rank != other.high_pair_rank
        high_pair_rank <=> other.high_pair_rank
      elsif low_pair_rank != other.low_pair_rank
        low_pair_rank <=> other.low_pair_rank
      else
        extra_card <=> other.extra_card
      end
    end

    def high_pair_rank
      pair_ranks.max
    end

    def low_pair_rank
      pair_ranks.min
    end

    def extra_card
      rank_counts
        .find { |rank, count| count == 1 }
        .first
    end

    def valid?
      two_pair?
    end

    private

    def pair_ranks
      rank_counts
        .select { |rank, count| count == 2 }
        .keys
    end
  end
end
