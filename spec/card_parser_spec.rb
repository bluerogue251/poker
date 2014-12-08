require 'card_parser'

describe CardParser do
  it "Takes a string and initializes a card" do
    card = CardParser.card_from("jh")
    expect(card.pips).to eq :jack
    expect(card.suit).to eq :hearts
  end

  it "Can deal with 10" do
    card = CardParser.card_from("10s")
    expect(card.pips).to eq 10
    expect(card.suit).to eq :spades
  end

  it "Fails upon invalid input" do
    expect {
      CardParser.card_from("x")
    }.to raise_error KeyError
  end
end
