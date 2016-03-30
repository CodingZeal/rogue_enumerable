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

end
