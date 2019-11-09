class VendingMachine
  ALLOWED_MONEY_LIST = [10, 50, 100, 500, 1000]
  NO_REFUND = 0

  def initialize
    @total_money = 0
    @stock = [
      *Array.new(5) { SoftDrink.new(name: 'コーラ', price: 120) },
      *Array.new(1) { SoftDrink.new(name: 'コーラ', price: 180) },
      *Array.new(3) { SoftDrink.new(name: 'ファンタ', price: 140) },
    ]
  end

  def insert_money(money)
    unless ALLOWED_MONEY_LIST.include?(money)
      return money
    end
    @total_money += money
    NO_REFUND
  end

  def total_money
    @total_money
  end

  def refund
    @total_money.tap { @total_money = 0 }
  end

  def stock
    @stock.uniq.map do |soft_drink|
      amount = @stock.select { |sd| sd == soft_drink }.size
      { name: soft_drink.name, price: soft_drink.price, amount: amount }
    end
  end
end
