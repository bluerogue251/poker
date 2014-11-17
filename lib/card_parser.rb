require 'card'

class CardParser
  def self.card_from(string)
    new(string).card
  end

  def initialize(string)
    @string = string
  end

  def card
    Card.new(pips, suit)
  end

  private
  attr_reader :string

  def pips
    {
      "2"  => 2,
      "3"  => 3,
      "4"  => 4,
      "5"  => 5,
      "6"  => 6,
      "7"  => 7,
      "8"  => 8,
      "9"  => 9,
      "10" => 10,
      "j"  => :jack,
      "q"  => :queen,
      "k"  => :king,
      "a"  => :ace
    }.fetch(string[0])
  end

  def suit
    {
      "c"  => :clubs,
      "h"  => :hearts,
      "s"  => :spades,
      "d"  => :diamonds
    }.fetch(string[1])
  end
end
