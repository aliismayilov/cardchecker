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
  end
end