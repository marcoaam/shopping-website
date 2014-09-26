class StockProduct

  include DataMapper::Resource

  property :id,       Serial
  property :quantity,  Integer

  belongs_to :product

  def update_quantity(amount, session)
    return if amount > self.quantity || amount < 1
    self.quantity = self.quantity - amount
    update_cart(session, self.id, amount)
  end

private

  def update_cart(session, product_id, amount)
    cart = CartProduct.first_or_create(session: session, product_id: product_id)
    cart.add_to_cart(amount)
    cart.save
  end

end