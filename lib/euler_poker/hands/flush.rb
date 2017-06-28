module EulerPoker
  class Flush
    include Handable

    def instance_comparison(other)
      descending_ranks <=> other.descending_ranks
    end

    def valid?
      flush?
    end
  end
end
