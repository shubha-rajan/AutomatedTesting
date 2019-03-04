
# deck.rb

require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    [:hearts, :spades, :clubs, :diamonds].each do |suit|
      (1..13).each do |value|
        card = Card.new(value, suit)
        @cards << card
      end
    end
  end

  def draw
    drawn_card = @cards.sample
    @cards.delete(drawn_card)
  end

  def shuffle
    @cards.shuffle!
  end

  def count
    return @cards.length
  end
end
