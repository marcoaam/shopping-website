get '/cart/add/:product/' do
  product = Product.first(id: params[:product])
  product.update_quantity(params[:quantity].to_i)
  product.save
  redirect to '/'
end