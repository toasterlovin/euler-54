module EulerPoker
  class FourOfAKind < Hand
    def <=>(other)
      return super unless super == 0

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
