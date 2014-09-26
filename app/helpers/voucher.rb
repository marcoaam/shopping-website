helpers do

  def voucher_10_off_valid?(voucher)
    (price_more_or_equal_to?(50)) && (voucher == GET10OFFVOUCHER)
  end

  def voucher_5_off_valid?(voucher)
    voucher == GET5OFFVOUCHER
  end

  def voucher_15_off_valid?(voucher)
    (price_more_or_equal_to?(75)) && (voucher == GET15OFFVOUCHER) &&
    any_footwear?
  end

  def any_footwear?
    get_cart_products.select { |item| item.product.category.title == 'Footwear' }.any?
  end

  def get_cart_products
    CartProduct.all(session: session[:session_id])
  end

  def price_more_or_equal_to?(amount)
    total_price(get_cart_products, 0) >= amount
  end

end