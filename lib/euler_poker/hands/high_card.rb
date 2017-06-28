module EulerPoker
  class HighCard < Hand
    def instance_comparison(other)
      descending_ranks <=> other.descending_ranks
    end

    def valid?
      true
    end
  end
end
