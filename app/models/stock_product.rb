  class StockProduct

  include DataMapper::Resource

  property :id,       Serial
  property :quantity,  Integer

  belongs_to :product

  def update_quantity(amount)
    return if amount > self.quantity || amount < 1
    self.quantity = self.quantity - amount
  end

end