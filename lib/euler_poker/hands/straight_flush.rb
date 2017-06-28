module EulerPoker
  class StraightFlush < Hand
    def instance_comparison(other)
      return ranks.max <=> other.ranks.max
    end

    def valid?
      straight_flush?
    end
  end
end
