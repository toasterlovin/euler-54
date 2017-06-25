module Poker
  class Round
    def initialize(round)
      @first, @second = HandFactory.round(round)
    end

    def winner
      if @first > @second
        :first
      elsif @first < @second
        :second
      else
        :tie
      end
    end
  end
end
