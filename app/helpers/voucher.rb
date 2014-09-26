helpers do

  def voucher_10_off_valid?(voucher)
    cart = CartProduct.all(session: session[:session_id])
    (total_price(cart, 0) >= 50) && (voucher == GET10OFFVOUCHER)
  end

  def voucher_5_off_valid?(voucher)
    voucher == GET5OFFVOUCHER
  end

  def voucher_15_off_valid?(voucher)
    cart = CartProduct.all(session: session[:session_id])
    (total_price(cart, 0) >= 75) && (voucher == GET15OFFVOUCHER) &&
    (any_footwear?(cart))
  end

  def any_footwear?(cart)
    cart.select { |item| item.product.category.title == 'Footwear' }.any?
  end

end