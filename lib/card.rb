
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit


  end

  def to_s
    return "#{value} of #{suit.to_s}"
  end
end
