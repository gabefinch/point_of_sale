require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('sinatra/activerecord')
require('pg')
require('./lib/product')
require('./lib/purchase')

get ('/') do
  @products = Product.all()
  erb(:index)
end

post ('/products') do
  product = params['product']
  price = params['price']
  Product.create({ :name => product, :price => price })
  redirect back
end

get ('/product/:id/edit') do
  @product = Product.find(params['id'].to_i)
  erb(:product_edit)
end

patch ('/product/:id') do
  @product = Product.find(params['id'].to_i())
  new_name = params['new_name']
  new_price = params['new_price']
  @product.update({:name => new_name, :price => new_price})
  @products = Product.all()
  redirect ('/')
end

delete ('/product/:id') do
  @product = Product.find(params['id'].to_i())
  @product.destroy()
  @products = Product.all()
  redirect ('/')
end

get ('/purchase') do
  erb(:purchase)
end

post('/total') do
  @params = params
  @products =[]
  product_ids = params["product_ids"]
  product_ids.each do |id|
    @products.push(Product.find(id.to_i()))
  end
  @purchase = Purchase.create({})
  # @purchase.create(:product_ids => product_ids)
  @purchase.products << @products
  erb(:total)
end
