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
      return 'Visa'

    else
      return 'Unknown'
    end
  end
end