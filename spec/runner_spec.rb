require "runner"

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
      output.should_receive(:puts).with('VISA: 4111111111111111       (valid)')
      runner.check('4111111111111111')
    end

    it "should output card validation when card number has whitespaces" do
      output.should_receive(:puts).with('MasterCard: 5105105105105106 (invalid)')
      runner.check('5105 1051 0510 5106')
    end
  end
end