module EulerPoker
  class Straight < Hand
    def instance_comparison(other)
      return ranks.max <=> other.ranks.max
    end

    def valid?
      straight?
    end
  end
end
