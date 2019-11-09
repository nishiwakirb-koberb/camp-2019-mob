class SoftDrink
  attr_reader :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def ==(other)
    self.name == other.name &&
        self.price == other.price
  end
end
