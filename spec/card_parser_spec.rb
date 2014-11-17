require 'card_parser'

describe CardParser do
  it "Takes a string and initializes a card" do
    card = CardParser.card_from("jh")
    expect(card.pips).to eq :jack
    expect(card.suit).to eq :hearts
  end

  it "Fails upon invalid input" do
    expect {
      CardParser.card_from("x")
    }.to raise_error KeyError
  end
end
