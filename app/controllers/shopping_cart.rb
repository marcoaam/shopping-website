get '/cart/add/:product/' do
  product = Product.first(id: params[:product])
  product.update(quantity: (product.quantity - params[:quantity].to_i))
  product.save
  redirect to '/'
end