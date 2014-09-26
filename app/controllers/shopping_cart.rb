get '/cart/add/:product/' do
  product = StockProduct.first(id: params[:product])
  product.update_quantity(params[:quantity].to_i, session[:session_id])
  product.save
  redirect to '/'
end

get '/cart/:cart_id/delete/' do
  cart = CartProduct.first(id: params[:cart_id])
  cart.delete_from_cart
  redirect to '/'
end