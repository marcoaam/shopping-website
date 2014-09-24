class Product

  include DataMapper::Resource

  property :id,       Serial
  property :title,     String
  property :gender,     String

  belongs_to :category

end