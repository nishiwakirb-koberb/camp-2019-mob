require 'spec_helper'
require './lib/soft_drink'

RSpec.describe SoftDrink do
  describe '#==' do
    example '等値の条件が正しい' do
      coke = SoftDrink.new(name: 'コーラ', price: 120)
      # 名前と値段が同じ
      other = SoftDrink.new(name: 'コーラ', price: 120)
      expect(coke).to eq other
      # 名前が異なる
      other = SoftDrink.new(name: 'ファンタ', price: 120)
      expect(coke).to_not eq other
      # 値段が異なる
      other = SoftDrink.new(name: 'コーラ', price: 180)
      expect(coke).to_not eq other
    end
  end

  describe '#eql?' do
    example 'ユニーク判定の条件が正しい' do
      drink_list = [
        *Array.new(5) { SoftDrink.new(name: 'コーラ', price: 120) },
        *Array.new(1) { SoftDrink.new(name: 'コーラ', price: 180) },
        *Array.new(3) { SoftDrink.new(name: 'ファンタ', price: 140) },
      ]
      expect(drink_list.uniq).to contain_exactly(
                                   SoftDrink.new(name: 'コーラ', price: 120),
                                   SoftDrink.new(name: 'コーラ', price: 180),
                                   SoftDrink.new(name: 'ファンタ', price: 140)
                                 )
    end
  end
end
