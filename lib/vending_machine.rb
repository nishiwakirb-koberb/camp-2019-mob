class VendingMachine
  def initialize
    @total_money = 0
  end

  def insert_money(money)
    @total_money += money
  end

  def total_money
    @total_money
  end
end
