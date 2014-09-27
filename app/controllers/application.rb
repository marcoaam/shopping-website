require 'securerandom'

get '/' do
  session[:session_id] ||= SecureRandom.hex
  voucher = Voucher.first(session: session[:session_id])
  @discount = voucher.nil? ? 0 : voucher.amount
  @cart = CartProduct.all(session: session[:session_id])
  @products = StockProduct.all
  erb :index
end