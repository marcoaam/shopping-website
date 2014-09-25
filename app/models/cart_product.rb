class CartProduct

  include DataMapper::Resource

  property :id,       Serial
  property :session_id, String
  property :quantity,  Integer

  belongs_to :product

end