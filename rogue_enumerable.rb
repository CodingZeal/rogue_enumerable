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
    select { |value| !yield(value) }
  end

  def first
    each do |value|
      return value
    end

    nil
  end

  def find
    each do |value|
      return value if yield(value)
    end

    nil
  end

  def each_with_object(object)
    each do |value|
      yield(value, object)
    end

    object
  end

  def reduce(initial_value)
    result = initial_value

    each do |value|
      result = yield(result, value)
    end

    result
  end

  def all?
    find { |value| !yield(value) }.nil?
  end
end
