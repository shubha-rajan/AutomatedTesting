
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    values = (1..13).to_a
    suits = [:hearts, :spades, :clubs, :diamonds]
    if !values.include?(value) || !suits.include?(suit)
      raise ArgumentError, "Valid suits are :hearts, :spades, :clubs, and :diamonds. " +
                           "Valid values are integers from 1-13"
    end
    @value = value
    @suit = suit
  end

  def to_s
    named_values = { 1 => "Ace",
                     11 => "Jack",
                     12 => "Queen",
                     13 => "King" }
    if named_values.keys.include?(@value)
      return "#{named_values[@value]} of #{@suit.to_s}"
    else
      return "#{@value} of #{@suit.to_s}"
    end
  end
end
