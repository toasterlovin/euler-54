module Poker
  class HighCard < Hand
    def <=>(other)
      return super unless super == 0

      ranks.sort.reverse <=> other.ranks.sort.reverse
    end

    def valid?
      true
    end
  end
end
