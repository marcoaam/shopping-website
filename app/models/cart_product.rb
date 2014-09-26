class CartProduct

  include DataMapper::Resource

  property :id,       Serial
  property :session, Text
  property :quantity,  Integer

  belongs_to :product

  def add_to_cart(amount)
    self.quantity =  self.quantity.nil? ? amount : self.quantity + amount
  end

end