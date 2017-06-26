module EulerPoker
  class CLI
    attr_reader :results

    def initialize(file)
      @file = File.open(file, 'r')
      print_results
    end

    private

    def print_results
      hands = 0
      results = []

      @file.each_line do |line|
        round = EulerPoker::Round.new(line)

        results << round.winner
        hands += 1
      end
      @file.close

      puts "First hand won #{results.count(:first)} out of #{hands} hands."
    end
  end
end
