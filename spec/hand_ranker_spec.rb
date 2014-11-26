require 'hand_ranker'

describe HandRanker do
  it "Values one_pair over high card" do
    high_card = double(combo: :high_card)
    one_pair = double(combo: :one_pair)
    expect(HandRanker.new([one_pair, high_card]).winner).to eq one_pair
  end

  it "Values full_house over three of a kind" do
    three_of_a_kind = double(combo: :three_of_a_kind)
    full_house = double(combo: :full_house)
    expect(HandRanker.new([three_of_a_kind, full_house]).winner).to eq full_house
  end

  it "Can deal with ties" do
    pending
    high_card_1 = double(combo: :high_card)
    high_card_2 = double(combo: :high_card)
    expect(HandRanker.new([high_card_1, high_card_2]).winner).to eq something_depends_on_tie_breaker
  end
end
