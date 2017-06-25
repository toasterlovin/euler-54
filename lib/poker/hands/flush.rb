module Poker
  class Flush < Hand
    def <=>(other)
      return super unless super == 0

      # Array's implementation of <=> does what we want
      # as long as the arrays are in descending order
      ranks.sort.reverse <=> other.ranks.sort.reverse
    end

    def valid?
      flush?
    end
  end
end
