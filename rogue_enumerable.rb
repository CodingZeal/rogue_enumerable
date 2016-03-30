module RogueEnumerable
  def map
    result = []

    each do |value|
      result << yield(value)
    end

    self.class.new(result)
  end

  def select
    result = []

    each do |value|
      result << value if yield(value)
    end

    self.class.new(result)
  end

  def reject
    result = []

    each do |value|
      result << value unless yield(value)
    end

    self.class.new(result)
  end
end
