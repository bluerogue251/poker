class Hand
  def initialize(cards)
    @cards = cards
  end

  def combo
    if royal_flush?
      :royal_flush
    elsif straight_flush?
      :straight_flush
    elsif of_a_kind?(4)
      :four_of_a_kind
    elsif of_a_kind?(3)
      :three_of_a_kind
    end
  end

  private
  attr_reader :cards

  def royal_flush?
    flush? && royal?
  end

  def straight_flush?
    flush? && straight?
  end

  def of_a_kind?(number)
    pips.each_with_object(Hash.new(0)) { |pip, counts| counts[pip] += 1 }.values.max == number
  end

  def flush?
    @flush ||= cards.map(&:suit).uniq.length == 1
  end

  # FIXME
  def straight?
    true
  end

  def royal?
    (pips - royal_pips).empty? && (royal_pips - pips).empty?
  end

  def pips
    @pips ||= cards.map(&:pips)
  end

  def royal_pips
    [10, :jack, :queen, :king, :ace]
  end
end