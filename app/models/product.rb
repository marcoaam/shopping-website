class Product

  include DataMapper::Resource

  property :id,       Serial
  property :title,     String
  property :gender,     String
  property :price,     Float

  belongs_to :category
  has 1, :stock_product, :cart_product
  
end