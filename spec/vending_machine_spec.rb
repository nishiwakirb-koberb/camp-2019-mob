require 'spec_helper'
require './lib/vending_machine'

RSpec.describe 'Vending machine' do
  example 'step 0' do
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    vending_machine = VendingMachine.new
    vending_machine.insert_money(10)
    expect(vending_machine.total_money).to eq 10

    vending_machine.insert_money(50)
    vending_machine.insert_money(100)
    vending_machine.insert_money(500)
    vending_machine.insert_money(1000)

    # 投入金額の総計を取得できる
    expect(vending_machine.total_money).to eq 1660

    # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
    expect(vending_machine.refund).to eq 1660
    expect(vending_machine.refund).to eq 0
    expect(vending_machine.total_money).to eq 0
  end

  example 'step 1' do
    # 想定外のもの（硬貨：１円玉、５円玉。お札：千円札以外のお札）が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    expect(vending_machine.insert_money(1)).to eq 1
  end
end
