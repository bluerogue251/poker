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
  end
end
