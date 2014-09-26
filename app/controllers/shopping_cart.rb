get '/cart/add/:product/' do
  product = StockProduct.first(id: params[:product])
  product.update_quantity(params[:quantity].to_i, session[:session_id])
  product.save
  redirect to '/'
end