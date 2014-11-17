class Card
  attr_reader :pips, :suit

  def initialize(pips, suit)
    @pips = pips
    @suit = suit
  end
end
