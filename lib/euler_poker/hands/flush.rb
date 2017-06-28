module EulerPoker
  class Flush < Hand
    def instance_comparison(other)
      descending_ranks <=> other.descending_ranks
    end

    def valid?
      flush?
    end
  end
end
