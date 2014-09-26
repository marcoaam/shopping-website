class CartProduct

  include DataMapper::Resource

  property :id,       Serial
  property :session, Text
  property :quantity,  Integer

  belongs_to :product

  def add_to_cart(amount)
    self.quantity =  self.quantity.nil? ? amount : self.quantity + amount
  end

  def delete_from_cart
    if self.quantity > 1
      self.quantity -= 1
      self.save
    else
      self.destroy
    end
    update_stock_product(self.product_id)
  end

private

  def update_stock_product(product_id)
    stock_product = StockProduct.first(product_id: product_id)
    stock_product.add_to_stock
    stock_product.save   
  end

end