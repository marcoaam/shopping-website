helpers do

  def total_price(cart_products, discount)
    return 0 if cart_products.none?
    products_total_price(cart_products, discount)
  end

  def total_items(cart_products)
    return 0 if cart_products.none?
    cart_products.sum(:quantity)
  end

  def products_total_price(cart_products, discount)
    cart_products.map { |cart_product| (cart_product.product.price * cart_product.quantity) }.inject(:+) - discount
  end

end