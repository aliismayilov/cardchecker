require "runner"
require "card"

describe Runner do
  let(:output)  { double('output').as_null_object }
  let(:runner)  { Runner.new(output) }

  describe "#start" do
    it "prompts user for input" do
      output.should_receive(:puts).with('Enter card number:')
      runner.start
    end
  end

  describe "#check" do
    it "should output card validation" do
      card = Card.new('4111111111111111')
      output.should_receive(:puts).with('VISA: 4111111111111111       (valid)')
      runner.check(card)
    end
  end
end