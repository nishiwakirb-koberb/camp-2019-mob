require 'spec_helper'
require './lib/vending_machine'
require './lib/soft_drink'

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
    vending_machine = VendingMachine.new
    expect(vending_machine.insert_money(1)).to eq 1
    expect(vending_machine.total_money).to eq 0

    expect(vending_machine.insert_money(5)).to eq 5
    expect(vending_machine.total_money).to eq 0

    expect(vending_machine.insert_money(5000)).to eq 5000
    expect(vending_machine.total_money).to eq 0

    expect(vending_machine.insert_money(10)).to eq 0
    expect(vending_machine.total_money).to eq 10
  end

  example 'step 2' do
    # 値段と名前の属性からなるジュースを１種類格納できる。
    # 初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
    coke = SoftDrink.new(name: 'コーラ', price: 120)
    vending_machine = VendingMachine.new

    # 格納されているジュースの情報（値段と名前と在庫）を取得できる。
    expect(vending_machine.stock).to contain_exactly(
      {price: 120, name: "コーラ", amount: 5},
      {price: 180, name: "コーラ", amount: 1},
      {price: 140, name: "ファンタ", amount: 3}
    )
  end
end
