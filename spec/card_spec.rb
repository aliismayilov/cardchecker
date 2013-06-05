require "card"

describe Card do
  describe "#type" do
    it "returns 'AMEX' when number begins with 34 or 37 and the length is 15" do
      card = Card.new('378282246310005')
      card.type.should == :AMEX
    end

    it "returns 'Discover' when number begins with 6011 and the length is 16" do
      card = Card.new('6011111111111117')
      card.type.should == :Discover
    end

    it "returns 'MasterCard' when number begins with 51 or 55 and the length is 16" do
      card = Card.new('5105105105105100')
      card.type.should == :MasterCard
    end

    it "returns 'VISA' when number begins with 4 and the length is 13 or 16" do
      card = Card.new('4111111111111111')
      card.type.should == :VISA
    end

    it "returns 'Unknown' for all other cases" do
      card = Card.new('9111111111111111')
      card.type.should == :Unknown
    end
  end

  describe "#luhn_valid?" do
    %w{
      4111111111111111
      4012888888881881
      6011111111111117
      5105105105105100
    }.each do |number|
      it "returns true when submitted number is validated by Luhn algorithm" do
        card = Card.new(number)
        card.luhn_valid?.should be_true
      end
    end

    %w{
      4111111111111
      5105105105105106
      378282246310005
    }.each do |number|
      it "returns false when submitted number is validated by Luhn algorithm" do
        card = Card.new(number)
        card.luhn_valid?.should be_false
      end
    end
  end

  
  describe "#output" do
    [
      ['4111111111111111',  'VISA: 4111111111111111       (valid)'],
      ['4111111111111',     'VISA: 4111111111111          (invalid)'],
      ['4012888888881881',  'VISA: 4012888888881881       (valid)'],
      ['378282246310005',   'AMEX: 378282246310005        (invalid)'],
      ['6011111111111117',  'Discover: 6011111111111117   (valid)'],
      ['5105105105105100',  'MasterCard: 5105105105105100 (valid)'],
      ['5105105105105106',  'MasterCard: 5105105105105106 (invalid)'],
      ['9111111111111111',  'Unknown: 9111111111111111    (invalid)']
    ].each do |number, result|
      it "outputs formatted result of sanity check over card number" do
        card = Card.new(number)
        card.output.should eql(result)
      end
    end
  end
end