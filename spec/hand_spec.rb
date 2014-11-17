require 'hand'

describe Hand do
  describe "#combo" do
    it "Knows about Royal Flushes" do
      cards = [
        double(pips: 10,     suit: :hearts),
        double(pips: :jack,  suit: :hearts),
        double(pips: :queen, suit: :hearts),
        double(pips: :king,  suit: :hearts),
        double(pips: :ace,   suit: :hearts)
      ]
      expect(Hand.new(cards).combo).to eq :royal_flush
    end

    it "Knows about Straight Flushes" do
      cards = [
        double(pips: 9,      suit: :hearts),
        double(pips: 10,     suit: :hearts),
        double(pips: :jack,  suit: :hearts),
        double(pips: :queen, suit: :hearts),
        double(pips: :king,  suit: :hearts)
      ]
      expect(Hand.new(cards).combo).to eq :straight_flush
    end

    it "Knows about Four of a kinds" do
      cards = [
        double(pips: 9,  suit: :clubs),
        double(pips: 9,  suit: :hearts),
        double(pips: 9,  suit: :spades),
        double(pips: 9,  suit: :diamonds),
        double(pips: 10, suit: :diamonds)
      ]
      expect(Hand.new(cards).combo).to eq :four_of_a_kind
    end

    it "Knows about Three of a kinds" do
      cards = [
        double(pips: 9,  suit: :clubs),
        double(pips: 9,  suit: :hearts),
        double(pips: 9,  suit: :spades),
        double(pips: 10, suit: :diamonds),
        double(pips: 10, suit: :spades)
      ]
      expect(Hand.new(cards).combo).to eq :three_of_a_kind
    end

    it "Knows about One pair" do
      cards = [
        double(pips: 9,  suit: :clubs),
        double(pips: 9,  suit: :hearts),
        double(pips: 8,  suit: :spades),
        double(pips: 7,  suit: :diamonds),
        double(pips: 6,  suit: :spades)
      ]
      expect(Hand.new(cards).combo).to eq :one_pair
    end

    it "Knows about high card" do
      cards = [
        double(pips: 10, suit: :clubs),
        double(pips: 9,  suit: :hearts),
        double(pips: 8,  suit: :spades),
        double(pips: 7,  suit: :diamonds),
        double(pips: 6,  suit: :spades)
      ]
      expect(Hand.new(cards).combo).to eq :high_card
    end
  end
end
