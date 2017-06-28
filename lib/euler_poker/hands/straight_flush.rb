module EulerPoker
  class StraightFlush
    include Handable

    def instance_comparison(other)
      return ranks.max <=> other.ranks.max
    end

    def valid?
      straight_flush?
    end
  end
end
