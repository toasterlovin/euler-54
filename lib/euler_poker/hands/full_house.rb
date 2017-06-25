module EulerPoker
  class FullHouse < Hand
    def <=>(other)
      return super unless super == 0

      if triplet_rank == other.triplet_rank
        return pair_rank <=> other.pair_rank
      else
        return triplet_rank <=> other.triplet_rank
      end
    end

    def triplet_rank
      rank_counts
        .find { |rank, count| count == 3 }
        .first
    end

    def pair_rank
      rank_counts
        .find { |rank, count| count == 2 }
        .first
    end

    def valid?
      full_house?
    end
  end
end
