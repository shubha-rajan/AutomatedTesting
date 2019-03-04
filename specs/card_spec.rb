
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
      values = [2, 4, 10]
      suits = [:diamonds, :hearts, :spades]

      expected_results = ["2 of diamonds", "4 of hearts", "10 of spades"]

      values.zip(suits).each_with_index do |param, index|
        card = Card.new(param[0], param[1])
        expect(card.to_s).must_equal(expected_results[index])
      end
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      values = [12, 1, 13]
      suits = [:hearts, :spades, :clubs]

      expected_results = ["Queen of hearts", "Ace of spades", "King of clubs"]

      values.zip(suits).each_with_index do |param, index|
        card = Card.new(param[0], param[1])
        expect(card.to_s).must_equal(expected_results[index])
      end
    end
  end

  describe "Reader methods" do
    it "Can retrieve the value of the card using a `.value`." do
      values = [2, 4, 10, 12, 1, 13]
      suits = [:diamonds, :hearts, :spades, :hearts, :spades, :clubs]

      values.zip(suits).each_with_index do |param, index|
        card = Card.new(param[0], param[1])
        expect(card.value).must_equal(values[index])
      end
    end

    it "Can retrieve the value of the card using a `.suit`." do
      values = [2, 4, 10, 12, 1, 13]
      suits = [:diamonds, :hearts, :spades, :hearts, :spades, :clubs]

      values.zip(suits).each_with_index do |param, index|
        card = Card.new(param[0], param[1])
        expect(card.suit).must_equal(suits[index])
      end
    end
  end
end
