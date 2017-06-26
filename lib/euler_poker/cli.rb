module EulerPoker
  class CLI
    attr_reader :results

    def initialize(file)
      @results = []

      File.open(file, 'r') do |f|
        f.each_line do |line|
          round = EulerPoker::Round.new(line)
          @results << round.winner
        end
      end

      puts "First hand won #{@results.count(:first)} times"
      puts "Second hand won #{@results.count(:second)} times"
    end
  end
end
