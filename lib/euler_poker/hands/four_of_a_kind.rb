module EulerPoker
  class FourOfAKind
    include Handable

    def instance_comparison(other)
      return quartet_rank <=> other.quartet_rank
    end

    def quartet_rank
      rank_counts
        .find { |rank, count| count == 4 }
        .first
    end

    def valid?
      four_of_a_kind?
    end
  end
end
