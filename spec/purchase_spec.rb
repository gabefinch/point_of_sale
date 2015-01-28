require('spec_helper')

describe (Purchase) do
  describe('#total') do
    it ('returns total as float for a given purchase') do
        test_purchase = Purchase.create({})
        apple = Product.create({:name => 'apple', :price => 1.00})
        orange = Product.create({:name => 'orange', :price => 2.00})
        banana = Product.create({:name => 'banana', :price => 0.75})
        test_purchase.products << [apple, orange, banana]
        expect(test_purchase.total()).to(eq(3.75))
    end
  end
end
