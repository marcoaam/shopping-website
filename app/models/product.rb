class Product

  include DataMapper::Resource

  property :id,       Serial
  property :title,     String
  property :gender,     String
  property :price,     Float

  belongs_to :category
  has 1, :stock_product
  has 1, :cart_product

end