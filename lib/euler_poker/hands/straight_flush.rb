module EulerPoker
  class StraightFlush < Hand
    def <=>(other)
      return super unless super == 0

      return ranks.max <=> other.ranks.max
    end

    def valid?
      straight_flush?
    end
  end
end
