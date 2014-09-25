class Product

  include DataMapper::Resource

  property :id,       Serial
  property :title,     String
  property :gender,     String
  property :price,     Float
  property :quantity,  Integer

  belongs_to :category

  def update_quantity(amount)
    return if amount > self.quantity || amount < 1
    self.quantity = self.quantity - amount
  end

end