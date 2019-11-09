require 'spec_helper'
require './lib/vending_machine'

RSpec.describe 'Vending machine' do
  example 'step 0' do
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    vending_machine = VendingMachine.new
    vending_machine.insert_money(10)
  end
end
