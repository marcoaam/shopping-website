class Cart

  include DataMapper::Resource

  property :id,       Serial
  property :session_id, String

end