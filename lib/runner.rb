class Runner
  def initialize(output)
    @output = output
  end

  def start
    @output.puts 'Enter card number:'
  end

  def check(card)
    @output.puts card.output
  end
end