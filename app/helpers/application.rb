helpers do

  def total_price(cart)
    return 0 if cart.none?
    cart.count > 1 ? products_total_price(cart) : one_product_price(cart)
  end

  def total_items(cart)
    return 0 if cart.none?
    cart.sum(:quantity)
  end

private

  def one_product_price(cart)
    cart.map { |cart_product| (cart_product.product.price * cart_product.quantity) }.first
  end

  def products_total_price(cart)
    cart.inject { |sum, item| (sum.product.price * sum.quantity) + (item.product.price * item.quantity) }
  end

end