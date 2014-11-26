require 'pips'

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
    elsif full_house?
      :full_house
    elsif flush?
      :flush
    elsif straight?
      :straight
    elsif of_a_kind?(3)
      :three_of_a_kind
    elsif of_a_kind?(2)
      :one_pair
    else
      :high_card
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

  def full_house?
    of_a_kind?(3) && of_a_kind?(2)
  end

  def of_a_kind?(number)
    pips.of_a_kind?(number)
  end

  def flush?
    @flush ||= cards.map(&:suit).uniq.length == 1
  end

  def straight?
    pips.straight?
  end

  def royal?
    pips.royal?
  end

  def pips
    @pips ||= Pips.new(cards.map(&:pips))
  end
end
