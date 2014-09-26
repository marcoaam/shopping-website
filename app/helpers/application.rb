helpers do

  def total_price(cart, discount)
    return 0 if cart.none?
    products_total_price(cart, discount)
  end

  def total_items(cart)
    return 0 if cart.none?
    cart.sum(:quantity)
  end

private

  def products_total_price(cart, discount)
    cart.map { |cart_product| (cart_product.product.price * cart_product.quantity) }.inject(:+) - discount
  end

end