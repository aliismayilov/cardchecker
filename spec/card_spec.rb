require "card"

describe Card do
  describe "#type" do
    it "returns 'AMEX' when number begins with 34 or 37 and the length is 15" do
      card = Card.new('378282246310005')
      card.type.should == 'AMEX'
    end

    it "returns 'Discover' when number begins with 6011 and the length is 16" do
      card = Card.new('6011111111111117')
      card.type.should == 'Discover'
    end

    it "returns 'MasterCard' when number begins with 51 or 55 and the length is 16" do
      card = Card.new('5105105105105100')
      card.type.should == 'MasterCard'
    end

    it "returns 'Visa' when number begins with 4 and the length is 13 or 16" do
      card = Card.new('4111111111111111')
      card.type.should == 'Visa'
    end

    it "returns 'Unknown' for all other cases" do
      card = Card.new('9111111111111111')
      card.type.should == 'Unknown'
    end
  end

  describe "#luhn_valid?" do
    it "returns true when submitted number is validated by Luhn algorithm" do
      card = Card.new('4111111111111111')
      card.luhn_valid?.should be_true

      card = Card.new('4012888888881881')
      card.luhn_valid?.should be_true

      card = Card.new('6011111111111117')
      card.luhn_valid?.should be_true

      card = Card.new('5105105105105100')
      card.luhn_valid?.should be_true
    end

    it "returns false when submitted number is validated by Luhn algorithm" do
      card = Card.new('4111111111111')
      card.luhn_valid?.should be_false

      card = Card.new('5105105105105106')
      card.luhn_valid?.should be_false

      card = Card.new('378282246310005')
      card.luhn_valid?.should be_false
    end
  end

  describe "#output" do
    it "outputs formatted result of sanity check over card number" do
      pending("complete type and luhn_valid tests")

      card = Card.new('4111111111111111')
      card.output.should eql('VISA: 4111111111111111       (valid)')

      card = Card.new('4111111111111')
      card.output.should eql('VISA: 4111111111111          (invalid)')

      card = Card.new('4012888888881881')
      card.output.should eql('VISA: 4012888888881881       (valid)')

      card = Card.new('378282246310005')
      card.output.should eql('AMEX: 378282246310005        (invalid)')

      card = Card.new('6011111111111117')
      card.output.should eql('Discover: 6011111111111117   (valid)')

      card = Card.new('5105105105105100')
      card.output.should eql('MasterCard: 5105105105105100 (valid)')

      card = Card.new('5105105105105106')
      card.output.should eql('MasterCard: 5105105105105106 (invalid)')

      card = Card.new('9111111111111111')
      card.output.should eql('Unknown: 9111111111111111    (invalid)')
    end
  end
end