require 'rspec'

class CoinChange
  def least_coins(returned_money)
    result = []
    if returned_money >= 25
      quantity_of_quarters = returned_money / 25
      quantity_of_quarters.times do
        result << 25
      end
    else 
      quantity_of_quarters = 0
    end
    returned_money = returned_money - (quantity_of_quarters * 25)

    if returned_money >= 10
      quantity_of_dimes = returned_money / 10
      quantity_of_dimes.times do
        result << 10
      end
    else 
      quantity_of_dimes = 0
    end
    returned_money = returned_money - (quantity_of_dimes * 10)

    if returned_money >= 5
      quantity_of_nickles = returned_money / 5
      quantity_of_nickles.times do
        result << 5
      end
    else 
      quantity_of_nickles = 0
    end
    returned_money = returned_money - quantity_of_nickles * 5

      quantity_of_pennies = returned_money % 5  #verify that this makes proper sense
      if quantity_of_pennies > 0
        quantity_of_pennies.times do
          result << 1
        end
      end

      return result
  end
end




RSpec.describe CoinChange do
  describe '#change' do
    it 'should return an array of change' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(0)).to eq([])
    end

    it 'should return and an arry with one 1 for number = 1' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(1)).to eq([1])
    end

    it 'should return an array with two 1s for number = 2' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(2)).to eq([1,1])
    end

    it 'should return an array with 3 1s for number = 3' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(3)).to eq([1,1,1])
    end

    it 'should return an array with 4 1s for number = 4' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(4)).to eq([1,1,1,1])
    end

    it 'should return an array with 5 for number = 5' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(5)).to eq([5])
    end

    it 'should return an array with 5, 1 for number = 6' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(6)).to eq([5, 1])
    end

    it 'should return an array with 5, 1, 1 for number = 7' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(7)).to eq([5, 1, 1])
    end

    it 'should return an array with 10 for number = 10' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(10)).to eq([10])
    end

    it 'should return an array with 10, 5, 1, 1 for number = 17' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(17)).to eq([10, 5, 1, 1])
    end

    it 'should return an array with 25 for number = 25' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(25)).to eq([25])
    end

    it 'should return an array with 26 for number = 26' do
      coin_change = CoinChange.new
      expect(coin_change.least_coins(26)).to eq([25, 1])
    end

  end
end