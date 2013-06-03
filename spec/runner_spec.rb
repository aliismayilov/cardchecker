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
end