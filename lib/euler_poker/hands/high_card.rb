module EulerPoker
  class HighCard < Hand
    def <=>(other)
      return super unless super == 0

      descending_ranks <=> other.descending_ranks
    end

    def valid?
      true
    end
  end
end
