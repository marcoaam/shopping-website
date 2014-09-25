require 'securerandom'

get '/' do
  session[:session_id] ||= SecureRandom.hex
  @cart = Cart.create(session_id: session[:session_id])
  @products = Product.all
	erb :index
end