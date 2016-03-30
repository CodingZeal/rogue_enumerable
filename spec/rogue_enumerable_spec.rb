describe "RogueEnumerable" do
  subject { TestEnumerable.new(input)}

  describe "map" do
    let(:input) { [1, 2, 3] }

    it "maps a block over an array" do
      expect(subject.map { |number| number * 2 }).to eq(
        TestEnumerable.new([2, 4, 6])
      )
    end
  end

  describe "select" do
    let(:input) { [1, 2, 3, 4, 5, 6] }

    it "includes values matching condition" do
      expect(subject.select { |number| number.odd? }).to eq(
        TestEnumerable.new([1, 3, 5])
      )
    end
  end

  describe "reject" do
    let(:input) { [1, 2, 3, 4, 5, 6] }

    it "omits values matching condition" do
      expect(subject.reject { |number| number.odd? }).to eq(
        TestEnumerable.new([2, 4, 6])
      )
    end
  end
  describe "first" do
    let(:input) { [1, 2, 3, 4, 5, 6] }

    it "returns the first value" do
      expect(subject.first).to eq(
        1
      )
    end

    context "with an empty collection" do
      let(:input) { [] }

      it "returns nil" do
        expect(subject.first).to eq(
          nil
        )
      end
    end
  end

  describe "find" do
    context "With small sets values" do
      let(:input) { [1, 2, 3, 4, 5, 6] }

      it "Returns the first element matching a condition" do
        expect(subject.find { |number| number.even? }).to eq(
          2
        )
      end

      it "returns nil if there are no matching elements" do
        expect(subject.find { |number| number > 100 }).to eq(
          nil
        )
      end
    end

    context "With large sets of values" do
      let(:input) { (1..100_000_000) }

      it "Returns the first element matching a condition" do
        expect(subject.find { |number| number.even? }).to eq(
          2
        )
      end
    end
  end

  describe "each_with_object" do
    let(:input) { [:a, :b, :c, :d, :d, :a, :b] }
    let(:memo) { Hash.new(0) }

    it "returns object with block applied to all values" do
      expect(
        subject.each_with_object(memo) do |value, object|
          object[value] += 1
        end
      ).to eq(
        { a: 2, b: 2, c: 1, d: 2 }
      )
    end
  end

  describe "reduce" do
    let(:input) { [1, 2, 3, 4, 5] }

    it "reduces the collection to a single value" do
      expect(subject.reduce(0) {|memo, number| memo + number }).to eq(
        15
      )
    end
  end

  describe "all?" do
    let(:input) { [1, 2, 3, 4, 5] }

    it "returns true if all elements satisfy condition" do
      expect(subject.all? {|number| number > 0 }).to eq(true)
    end
  end
end
