module Poker
  class Straight < Hand
    def <=>(other)
      return super unless super == 0

      return ranks.max <=> other.ranks.max
    end

    def valid?
      straight?
    end
  end
end
