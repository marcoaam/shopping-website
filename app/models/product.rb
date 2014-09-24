class Product

  include DataMapper::Resource

  property :id,       Serial
  property :title,     String
  property :gender,     String
  property :price,     Float
  property :quantity,  Integer

  belongs_to :category

end