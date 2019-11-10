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
end
