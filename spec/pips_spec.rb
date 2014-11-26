require 'pips'

describe Pips do
  describe "self#straight?" do
    it "Returns true if the pips are a straight" do
      pips = Pips.new([3, 4, 5, 6, 7])
      expect(pips.straight?).to eq true
    end

    it "Returns true if the pips are a straight even if they are out of order" do
      pips = Pips.new([7, 3, 6, 4, 5])
      expect(pips.straight?).to eq true
    end

    it "Returns true if the pips are a straight" do
      pips = Pips.new([8, 9, 10, :jack, :queen])
      expect(pips.straight?).to eq true
    end

    it "Returns true if the pips are a straight" do
      pips = Pips.new([9, 10, :jack, :queen, :king])
      expect(pips.straight?).to eq true
    end

    it "Returns false if the pips are NOT a straight" do
      pips = Pips.new([2, 4, 5, 6, 7])
      expect(pips.straight?).to eq false
    end

    it "Returns false if the pips are NOT a straight" do
      pips = Pips.new([9, 10, :jack, :queen, :ace])
      expect(pips.straight?).to eq false
    end
  end

  describe "self#royal?" do
    it "Returns true if the pips are royal" do
      pips = Pips.new([:king, 10, :ace, :jack, :queen])
      expect(pips.royal?).to eq true
    end

    it "Returns false if the pips are NOT royal" do
      pips = Pips.new([9, 10, :jack, :queen, :king])
      expect(pips.royal?).to eq false
    end
  end
end
