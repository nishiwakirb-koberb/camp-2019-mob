class VendingMachine
  def initialize
    @total_money = 0
  end

  def insert_money(money)
    if money == 1 || money == 5
      return money
    end
    @total_money += money
  end

  def total_money
    @total_money
  end

  def refund
    @total_money.tap { @total_money = 0 }
  end
end
