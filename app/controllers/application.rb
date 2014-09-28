get '/' do
  session[:session_id] ||= SecureRandom.hex
  @discount = Voucher.get_if_valid(session[:session_id]).nil? ? 0 : Voucher.get_if_valid(session[:session_id]).amount
  @cart = CartProduct.all(session: session[:session_id])
  @products = StockProduct.all
  erb :index
end