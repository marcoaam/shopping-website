class Product

  include DataMapper::Resource

  property :id,       Serial
  property :title,     String

end