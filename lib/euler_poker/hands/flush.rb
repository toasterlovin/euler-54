module EulerPoker
  class Flush < Hand
    def <=>(other)
      return super unless super == 0

      descending_ranks <=> other.descending_ranks
    end

    def valid?
      flush?
    end
  end
end
