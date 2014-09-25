require 'securerandom'

get '/' do
  session[:session_id] ||= SecureRandom.hex
  @cart = CartProduct.create(session_id: session[:session_id])
  @products = StockProduct.all
	erb :index
end