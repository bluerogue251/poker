class Pips
  ORDERED_PIPS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

  def initialize(pips)
    @pips = pips
  end

  def straight?
    consecutive?(sorted_pip_indexes)
  end

  def royal?
    (pips - royal_pips).empty? && (royal_pips - pips).empty?
  end

  def of_a_kind?(number)
    pips.each_with_object(Hash.new(0)) { |pip, counts| counts[pip] += 1 }.values.include?(number)
  end

  private
  attr_reader :pips

  def sorted_pip_indexes
    pips.map { |pip| ORDERED_PIPS.index(pip) }.sort
  end

  def royal_pips
    @royal_pips ||= ORDERED_PIPS[-5..-1]
  end

  def consecutive?(array)
    array.each_with_index do |int, index|
      return false unless index == 0 || int == (array[index - 1] + 1)
    end
    return true
  end
end
