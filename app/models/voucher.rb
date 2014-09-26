class Voucher

  include DataMapper::Resource

  property :id,       Serial
  property :session, Text
  property :amount,  Integer

end