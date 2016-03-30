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

    it "selects values matching condition" do
      expect(subject.select { |number| number.odd? }).to eq(
        TestEnumerable.new([1, 3, 5])
      )
    end
  end
end
