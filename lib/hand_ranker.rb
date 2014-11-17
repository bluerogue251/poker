class HandRanker
  COMBOS = [:nothing, :high_card, :one_pair, :two_pair, :three_of_a_kind, :straight,
            :flush, :full_house, :four_of_a_kind, :straight_flush, :straight_flush]

  def initialize(hands)
    @hands = hands
  end

  def winner
    hands.max_by { |hand| COMBOS.index(hand.combo) }
  end

  private
  attr_reader :hands
end
