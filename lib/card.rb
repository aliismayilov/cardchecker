class Card
  def initialize(number)
    @number = number
  end

  def type
    # begins with 34 or 37 and the length is 15
    if @number[0,2] == '34' or @number[0,2] == '37' and @number.length == 15
      return 'AMEX'

    # begins with 6011 and the length is 16
    elsif @number[0,4] == '6011' and @number.length == 16
      return 'Discover'

    # begins with 51 or 55 and the length is 16
    elsif @number[0,2] == '51' or @number[0,2] == '55' and @number.length == 16
      return 'MasterCard'

    # begins with 4 and the length is 13 or 16
    elsif @number[0,1] == '4' and (@number.length == 13 or @number.length == 16)
      return 'VISA'

    else
      return 'Unknown'
    end
  end

  def luhn_valid?
    def digit_sum(digit_string)
      sum = 0
      digit_string.each_char do |d|
        sum += d.to_i
      end
      sum
    end

    digit_string = ''
    (0..(@number.length - 1)).each do |index|
      if index % 2 == 0
        digit_string += (@number[index].to_i * 2).to_s
      else
        digit_string += @number[index]
      end
    end

    digit_sum(digit_string) % 10 == 0
  end

  def valid?
    if self.type != 'Unknown' and self.luhn_valid?
      'valid'
    else
      'invalid'
    end
  end

  def output
    "%-28s (#{self.valid?})" % (self.type + ': ' + @number)
  end
end