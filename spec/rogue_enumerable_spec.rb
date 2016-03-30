describe "RogueEnumerable" do
  describe "Map" do
    subject { TestEnumerable.new([1, 2, 3])}
    it "maps a block over an array" do
      expect(subject.map { |number| number * 2 }).to eq(
        TestEnumerable.new([2, 4, 6])
      )
    end
  end
end
