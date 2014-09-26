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
  end

end