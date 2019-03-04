

require_relative "spec_helper"

describe Deck do
  it "initializes a deck object" do
    new_deck = Deck.new
    expect(new_deck).must_be_instance_of Deck
  end
  it "contains 52 card objects in an array" do
    new_deck = Deck.new

    expect(new_deck.cards).must_be_instance_of Array
    expect(new_deck.cards.length).must_equal 52
    new_deck.cards.each do |card|
      expect(card).must_be_instance_of Card
    end
  end

  it "contains 52 unique cards" do
    new_deck = Deck.new
    expect(new_deck.cards.length).must_equal new_deck.cards.uniq.length
  end
  it "has a working shuffle method" do
    new_deck = Deck.new
    before_shuffle = new_deck.cards.clone

    new_deck.shuffle

    expect(new_deck.cards).wont_equal(before_shuffle)
  end
  it "has a draw method that returns a card and removes it from the deck" do
    new_deck = Deck.new
    drawn_card = new_deck.draw

    expect(drawn_card).must_be_instance_of Card
    expect(new_deck.cards).wont_include (drawn_card)
  end
  it "has a count method that returns the number of cards in the deck" do
    new_deck = Deck.new
    5.times do
      expect(new_deck.count).must_equal new_deck.cards.length
      new_deck.draw
    end
  end
end
