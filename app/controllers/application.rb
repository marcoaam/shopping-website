require 'securerandom'

get '/' do
  session[:session_id] ||= SecureRandom.hex
  @cart = CartProduct.all(session: session[:session_id])
  @products = StockProduct.all
	erb :index
end