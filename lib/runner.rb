require "card"

class Runner
  def initialize(output)
    @output = output
  end

  def start
    @output.puts 'Enter card number:'
  end

  def check(number)
    card = Card.new(number)
    @output.puts card.output
  end
end