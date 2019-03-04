
require_relative "spec_helper"

describe Card do
  describe "You can create a Card instance" do
    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect { Card.new(0, :diamonds) }.must_raise ArgumentError
      expect { Card.new(14, :diamonds) }.must_raise ArgumentError
      expect { Card.new(14, :clovers) }.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do
    it "to_s returns a readable String value logically for values 2-10" do
      card1 = Card.new(2, :diamonds)
      card2 = Card.new(4, :hearts)
      card3 = Card.new(10, :spades)

      expect(card1.to_s).must_equal("2 of diamonds")
      expect(card2.to_s).must_equal("4 of hearts")
      expect(card3.to_s).must_equal("10 of spades")
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      card1 = Card.new(12, :hearts)
      card2 = Card.new(1, :spades)
      card3 = Card.new(13, :clubs)

      expect(card1.to_s).must_equal("Queen of hearts")
      expect(card2.to_s).must_equal("Ace of spades")
      expect(card3.to_s).must_equal("King of clubs")
    end
  end

  describe "Reader methods" do
    it "Can retrieve the value of the card using a `.value`." do
      card1 = Card.new(2, :diamonds)
      card2 = Card.new(4, :hearts)
      card3 = Card.new(10, :spades)
      card4 = Card.new(12, :hearts)
      card5 = Card.new(1, :spades)
      card6 = Card.new(13, :clubs)

      expect(card1.value).must_equal(2)
      expect(card2.value).must_equal(4)
      expect(card3.value).must_equal(10)
      expect(card4.value).must_equal(12)
      expect(card5.value).must_equal(1)
      expect(card6.value).must_equal(13)
    end

    it "Can retrieve the value of the card using a `.suit`." do
      card1 = Card.new(2, :diamonds)
      card2 = Card.new(4, :hearts)
      card3 = Card.new(10, :spades)

      expect(card1.suit).must_equal(:diamonds)
      expect(card2.suit).must_equal(:hearts)
      expect(card3.suit).must_equal(:spades)
    end
  end
end
