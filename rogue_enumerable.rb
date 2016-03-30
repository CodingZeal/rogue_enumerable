module RogueEnumerable
  def map
    result = []

    each do |value|
      result << yield(value)
    end

    self.class.new(result)
  end
end
