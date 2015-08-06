class FakeHashWrapper
  attr_reader :hash

  def initialize
    @hash = {}
    @keys = []
  end

  def []=(key, value)
    @hash[key.to_sym] = value
    @keys << key
  end

  def [](key)
    @hash[key.to_sym]
  end

  def keys
    @keys.sort.reverse
  end

  def first_letter(letter)
    @hash.values.select { |v| @hash.key(v)[0] == letter }
  end

  def each
    i = 0
    while i < hash.length
      yield @keys[i], @hash[@keys[i]]
      i += 1
    end
  end
end
